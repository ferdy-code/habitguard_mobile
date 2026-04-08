import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/completion_dao.dart';
import '../../../../core/database/daos/habit_dao.dart';
import '../../domain/entities/completion.dart';
import '../../domain/entities/habit.dart';
import '../remote/habit_remote_source.dart';

extension _HabitDataExt on LocalHabitData {
  Habit toEntity() => Habit(
    id: id,
    userId: userId,
    title: title,
    description: description,
    emoji: emoji,
    color: color,
    frequency: HabitFrequency.values.firstWhere(
      (e) => e.name == frequency,
      orElse: () => HabitFrequency.daily,
    ),
    customDays: customDays != null ? int.tryParse(customDays!) : null,
    targetCount: targetCount,
    category: category,
    reminderEnabled: reminderEnabled,
    reminderTime: reminderTime,
    sortOrder: sortOrder,
    isArchived: isArchived,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension _CompletionDataExt on LocalCompletionData {
  Completion toEntity() => Completion(
    id: id,
    habitId: habitId,
    completedAt: completedAt,
    note: note,
    count: count,
  );
}

class HabitRepositoryImpl {
  final HabitDao _habitDao;
  final CompletionDao _completionDao;
  final HabitRemoteSource _remote;

  HabitRepositoryImpl(this._habitDao, this._completionDao, this._remote);

  Future<bool> _isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result.any(
      (r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet,
    );
  }

  Future<List<Habit>> getHabits() async {
    if (await _isOnline()) {
      try {
        final models = await _remote.getHabits();
        await _habitDao.upsertAll(
          models.map((m) => m.toLocalCompanion()).toList(),
        );
        return models.map((m) => m.toEntity()).toList();
      } catch (e, st) {
        log('getHabits remote error: $e', error: e, stackTrace: st);
        rethrow;
      }
    }
    final local = await _habitDao.getActiveHabits();
    return local.map((h) => h.toEntity()).toList();
  }

  Future<Habit?> getHabitById(String id) async {
    final local = await _habitDao.getHabitById(id);
    return local?.toEntity();
  }

  Future<void> createHabit(String userId, CreateHabitRequest req) async {
    final now = DateTime.now();

    if (await _isOnline()) {
      final model = await _remote.createHabit(req);
      await _habitDao.upsertHabit(model.toLocalCompanion());
    } else {
      final tempId = 'tmp_${now.microsecondsSinceEpoch}';
      await _habitDao.upsertHabit(
        LocalHabitsCompanion(
          id: Value(tempId),
          userId: Value(userId),
          title: Value(req.title),
          description: Value(req.description),
          emoji: Value(req.emoji),
          color: Value(req.color),
          frequency: Value(req.frequency.name),
          customDays: Value(req.customDays?.toString()),
          targetCount: Value(req.targetCount),
          category: Value(req.category),
          reminderEnabled: Value(req.reminderEnabled),
          reminderTime: Value(req.reminderTime),
          sortOrder: const Value(0),
          isArchived: const Value(false),
          isSynced: const Value(false),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await _habitDao.addToSyncQueue(
        SyncQueueCompanion(
          entityType: const Value('habit'),
          entityId: Value(tempId),
          action: const Value('create'),
          payload: Value(jsonEncode(req.toJson())),
          retryCount: const Value(0),
          createdAt: Value(now),
        ),
      );
    }
  }

  Future<void> updateHabit(String id, UpdateHabitRequest req) async {
    final now = DateTime.now();

    // Optimistic local update
    final existing = await _habitDao.getHabitById(id);
    if (existing != null) {
      await _habitDao.upsertHabit(
        existing
            .toCompanion(true)
            .copyWith(
              title: req.title != null
                  ? Value(req.title!)
                  : const Value.absent(),
              description: req.description != null
                  ? Value(req.description)
                  : const Value.absent(),
              emoji: req.emoji != null
                  ? Value(req.emoji!)
                  : const Value.absent(),
              color: req.color != null
                  ? Value(req.color!)
                  : const Value.absent(),
              frequency: req.frequency != null
                  ? Value(req.frequency!.name)
                  : const Value.absent(),
              customDays: req.customDays != null
                  ? Value(req.customDays.toString())
                  : const Value.absent(),
              targetCount: req.targetCount != null
                  ? Value(req.targetCount!)
                  : const Value.absent(),
              category: req.category != null
                  ? Value(req.category)
                  : const Value.absent(),
              reminderEnabled: req.reminderEnabled != null
                  ? Value(req.reminderEnabled!)
                  : const Value.absent(),
              reminderTime: req.reminderTime != null
                  ? Value(req.reminderTime)
                  : const Value.absent(),
              sortOrder: req.sortOrder != null
                  ? Value(req.sortOrder!)
                  : const Value.absent(),
              updatedAt: Value(now),
              isSynced: const Value(false),
            ),
      );
    }

    if (await _isOnline()) {
      try {
        final model = await _remote.updateHabit(id, req);
        await _habitDao.upsertHabit(model.toLocalCompanion());
      } catch (_) {}
    }
  }

  Future<void> archiveHabit(String id) async {
    final now = DateTime.now();
    final existing = await _habitDao.getHabitById(id);
    if (existing != null) {
      await _habitDao.upsertHabit(
        existing
            .toCompanion(true)
            .copyWith(
              isArchived: const Value(true),
              isSynced: const Value(false),
              updatedAt: Value(now),
            ),
      );
    }
    if (await _isOnline()) {
      try {
        await _remote.archiveHabit(id);
        await _habitDao.upsertHabit(
          existing!.toCompanion(true).copyWith(isSynced: const Value(true)),
        );
      } catch (_) {}
    }
  }

  Future<List<Completion>> getCompletionsForDate(DateTime date) async {
    final local = await _completionDao.getCompletionsForDate(date);
    return local.map((c) => c.toEntity()).toList();
  }

  Future<List<Completion>> getAllCompletionsForHabit(String habitId) async {
    final local = await _completionDao.getCompletionsForHabit(habitId);
    return local.map((c) => c.toEntity()).toList();
  }

  Future<void> toggleCompletion(
    String habitId,
    DateTime date, {
    String? note,
  }) async {
    final existing = await _completionDao.getCompletionForHabitOnDate(
      habitId,
      date,
    );

    if (existing != null) {
      // Toggle OFF
      await _completionDao.deleteCompletion(existing.id);
    } else {
      // Toggle ON — optimistic local insert
      final tempId = 'tmp_${DateTime.now().microsecondsSinceEpoch}';
      final completedAt = DateTime(
        date.year,
        date.month,
        date.day,
        DateTime.now().hour,
        DateTime.now().minute,
      );
      await _completionDao.upsertCompletion(
        LocalCompletionsCompanion(
          id: Value(tempId),
          habitId: Value(habitId),
          completedAt: Value(completedAt),
          note: Value(note),
          count: const Value(1),
          isSynced: const Value(false),
        ),
      );

      if (await _isOnline()) {
        try {
          final result = await _remote.toggleCompletion(
            habitId,
            date,
            note: note,
          );
          if (result.completed && result.completion != null) {
            await _completionDao.deleteCompletion(tempId);
            await _completionDao.upsertCompletion(
              result.completion!.toLocalCompanion(),
            );
          }
        } catch (_) {
          // keep local, will sync later
        }
      }
    }

    // Fire remote toggle for OFF case or catch-up sync
    if (existing != null && await _isOnline()) {
      try {
        await _remote.toggleCompletion(habitId, date, note: note);
      } catch (_) {}
    }
  }

  Future<void> reorderHabit(String habitId, int newSortOrder) async {
    final existing = await _habitDao.getHabitById(habitId);
    if (existing == null) return;
    await _habitDao.upsertHabit(
      existing.toCompanion(true).copyWith(sortOrder: Value(newSortOrder)),
    );
    if (await _isOnline()) {
      try {
        await _remote.updateHabit(
          habitId,
          UpdateHabitRequest(sortOrder: newSortOrder),
        );
      } catch (_) {}
    }
  }
}
