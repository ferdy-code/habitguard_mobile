// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocalHabitsTable extends LocalHabits
    with TableInfo<$LocalHabitsTable, LocalHabitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalHabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('⭐'),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('#4CAF50'),
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('daily'),
  );
  static const VerificationMeta _customDaysMeta = const VerificationMeta(
    'customDays',
  );
  @override
  late final GeneratedColumn<String> customDays = GeneratedColumn<String>(
    'custom_days',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetCountMeta = const VerificationMeta(
    'targetCount',
  );
  @override
  late final GeneratedColumn<int> targetCount = GeneratedColumn<int>(
    'target_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderEnabledMeta = const VerificationMeta(
    'reminderEnabled',
  );
  @override
  late final GeneratedColumn<bool> reminderEnabled = GeneratedColumn<bool>(
    'reminder_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderTimeMeta = const VerificationMeta(
    'reminderTime',
  );
  @override
  late final GeneratedColumn<String> reminderTime = GeneratedColumn<String>(
    'reminder_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    description,
    emoji,
    color,
    frequency,
    customDays,
    targetCount,
    category,
    reminderEnabled,
    reminderTime,
    sortOrder,
    isArchived,
    isSynced,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_habits';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalHabitData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    }
    if (data.containsKey('custom_days')) {
      context.handle(
        _customDaysMeta,
        customDays.isAcceptableOrUnknown(data['custom_days']!, _customDaysMeta),
      );
    }
    if (data.containsKey('target_count')) {
      context.handle(
        _targetCountMeta,
        targetCount.isAcceptableOrUnknown(
          data['target_count']!,
          _targetCountMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('reminder_enabled')) {
      context.handle(
        _reminderEnabledMeta,
        reminderEnabled.isAcceptableOrUnknown(
          data['reminder_enabled']!,
          _reminderEnabledMeta,
        ),
      );
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
        _reminderTimeMeta,
        reminderTime.isAcceptableOrUnknown(
          data['reminder_time']!,
          _reminderTimeMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalHabitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalHabitData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      customDays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_days'],
      ),
      targetCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_count'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      reminderEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_enabled'],
      )!,
      reminderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reminder_time'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LocalHabitsTable createAlias(String alias) {
    return $LocalHabitsTable(attachedDatabase, alias);
  }
}

class LocalHabitData extends DataClass implements Insertable<LocalHabitData> {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String emoji;
  final String color;
  final String frequency;
  final String? customDays;
  final int targetCount;
  final String? category;
  final bool reminderEnabled;
  final String? reminderTime;
  final int sortOrder;
  final bool isArchived;
  final bool isSynced;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalHabitData({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.emoji,
    required this.color,
    required this.frequency,
    this.customDays,
    required this.targetCount,
    this.category,
    required this.reminderEnabled,
    this.reminderTime,
    required this.sortOrder,
    required this.isArchived,
    required this.isSynced,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['emoji'] = Variable<String>(emoji);
    map['color'] = Variable<String>(color);
    map['frequency'] = Variable<String>(frequency);
    if (!nullToAbsent || customDays != null) {
      map['custom_days'] = Variable<String>(customDays);
    }
    map['target_count'] = Variable<int>(targetCount);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['reminder_enabled'] = Variable<bool>(reminderEnabled);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<String>(reminderTime);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_archived'] = Variable<bool>(isArchived);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LocalHabitsCompanion toCompanion(bool nullToAbsent) {
    return LocalHabitsCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      emoji: Value(emoji),
      color: Value(color),
      frequency: Value(frequency),
      customDays: customDays == null && nullToAbsent
          ? const Value.absent()
          : Value(customDays),
      targetCount: Value(targetCount),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      reminderEnabled: Value(reminderEnabled),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      sortOrder: Value(sortOrder),
      isArchived: Value(isArchived),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalHabitData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalHabitData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      emoji: serializer.fromJson<String>(json['emoji']),
      color: serializer.fromJson<String>(json['color']),
      frequency: serializer.fromJson<String>(json['frequency']),
      customDays: serializer.fromJson<String?>(json['customDays']),
      targetCount: serializer.fromJson<int>(json['targetCount']),
      category: serializer.fromJson<String?>(json['category']),
      reminderEnabled: serializer.fromJson<bool>(json['reminderEnabled']),
      reminderTime: serializer.fromJson<String?>(json['reminderTime']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'emoji': serializer.toJson<String>(emoji),
      'color': serializer.toJson<String>(color),
      'frequency': serializer.toJson<String>(frequency),
      'customDays': serializer.toJson<String?>(customDays),
      'targetCount': serializer.toJson<int>(targetCount),
      'category': serializer.toJson<String?>(category),
      'reminderEnabled': serializer.toJson<bool>(reminderEnabled),
      'reminderTime': serializer.toJson<String?>(reminderTime),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isArchived': serializer.toJson<bool>(isArchived),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalHabitData copyWith({
    String? id,
    String? userId,
    String? title,
    Value<String?> description = const Value.absent(),
    String? emoji,
    String? color,
    String? frequency,
    Value<String?> customDays = const Value.absent(),
    int? targetCount,
    Value<String?> category = const Value.absent(),
    bool? reminderEnabled,
    Value<String?> reminderTime = const Value.absent(),
    int? sortOrder,
    bool? isArchived,
    bool? isSynced,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalHabitData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    emoji: emoji ?? this.emoji,
    color: color ?? this.color,
    frequency: frequency ?? this.frequency,
    customDays: customDays.present ? customDays.value : this.customDays,
    targetCount: targetCount ?? this.targetCount,
    category: category.present ? category.value : this.category,
    reminderEnabled: reminderEnabled ?? this.reminderEnabled,
    reminderTime: reminderTime.present ? reminderTime.value : this.reminderTime,
    sortOrder: sortOrder ?? this.sortOrder,
    isArchived: isArchived ?? this.isArchived,
    isSynced: isSynced ?? this.isSynced,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalHabitData copyWithCompanion(LocalHabitsCompanion data) {
    return LocalHabitData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      color: data.color.present ? data.color.value : this.color,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      customDays: data.customDays.present
          ? data.customDays.value
          : this.customDays,
      targetCount: data.targetCount.present
          ? data.targetCount.value
          : this.targetCount,
      category: data.category.present ? data.category.value : this.category,
      reminderEnabled: data.reminderEnabled.present
          ? data.reminderEnabled.value
          : this.reminderEnabled,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalHabitData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('emoji: $emoji, ')
          ..write('color: $color, ')
          ..write('frequency: $frequency, ')
          ..write('customDays: $customDays, ')
          ..write('targetCount: $targetCount, ')
          ..write('category: $category, ')
          ..write('reminderEnabled: $reminderEnabled, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    title,
    description,
    emoji,
    color,
    frequency,
    customDays,
    targetCount,
    category,
    reminderEnabled,
    reminderTime,
    sortOrder,
    isArchived,
    isSynced,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalHabitData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.description == this.description &&
          other.emoji == this.emoji &&
          other.color == this.color &&
          other.frequency == this.frequency &&
          other.customDays == this.customDays &&
          other.targetCount == this.targetCount &&
          other.category == this.category &&
          other.reminderEnabled == this.reminderEnabled &&
          other.reminderTime == this.reminderTime &&
          other.sortOrder == this.sortOrder &&
          other.isArchived == this.isArchived &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LocalHabitsCompanion extends UpdateCompanion<LocalHabitData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> emoji;
  final Value<String> color;
  final Value<String> frequency;
  final Value<String?> customDays;
  final Value<int> targetCount;
  final Value<String?> category;
  final Value<bool> reminderEnabled;
  final Value<String?> reminderTime;
  final Value<int> sortOrder;
  final Value<bool> isArchived;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LocalHabitsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.emoji = const Value.absent(),
    this.color = const Value.absent(),
    this.frequency = const Value.absent(),
    this.customDays = const Value.absent(),
    this.targetCount = const Value.absent(),
    this.category = const Value.absent(),
    this.reminderEnabled = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalHabitsCompanion.insert({
    required String id,
    required String userId,
    required String title,
    this.description = const Value.absent(),
    this.emoji = const Value.absent(),
    this.color = const Value.absent(),
    this.frequency = const Value.absent(),
    this.customDays = const Value.absent(),
    this.targetCount = const Value.absent(),
    this.category = const Value.absent(),
    this.reminderEnabled = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isSynced = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LocalHabitData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? emoji,
    Expression<String>? color,
    Expression<String>? frequency,
    Expression<String>? customDays,
    Expression<int>? targetCount,
    Expression<String>? category,
    Expression<bool>? reminderEnabled,
    Expression<String>? reminderTime,
    Expression<int>? sortOrder,
    Expression<bool>? isArchived,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (emoji != null) 'emoji': emoji,
      if (color != null) 'color': color,
      if (frequency != null) 'frequency': frequency,
      if (customDays != null) 'custom_days': customDays,
      if (targetCount != null) 'target_count': targetCount,
      if (category != null) 'category': category,
      if (reminderEnabled != null) 'reminder_enabled': reminderEnabled,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isArchived != null) 'is_archived': isArchived,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalHabitsCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? emoji,
    Value<String>? color,
    Value<String>? frequency,
    Value<String?>? customDays,
    Value<int>? targetCount,
    Value<String?>? category,
    Value<bool>? reminderEnabled,
    Value<String?>? reminderTime,
    Value<int>? sortOrder,
    Value<bool>? isArchived,
    Value<bool>? isSynced,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LocalHabitsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      emoji: emoji ?? this.emoji,
      color: color ?? this.color,
      frequency: frequency ?? this.frequency,
      customDays: customDays ?? this.customDays,
      targetCount: targetCount ?? this.targetCount,
      category: category ?? this.category,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      reminderTime: reminderTime ?? this.reminderTime,
      sortOrder: sortOrder ?? this.sortOrder,
      isArchived: isArchived ?? this.isArchived,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (customDays.present) {
      map['custom_days'] = Variable<String>(customDays.value);
    }
    if (targetCount.present) {
      map['target_count'] = Variable<int>(targetCount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (reminderEnabled.present) {
      map['reminder_enabled'] = Variable<bool>(reminderEnabled.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<String>(reminderTime.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalHabitsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('emoji: $emoji, ')
          ..write('color: $color, ')
          ..write('frequency: $frequency, ')
          ..write('customDays: $customDays, ')
          ..write('targetCount: $targetCount, ')
          ..write('category: $category, ')
          ..write('reminderEnabled: $reminderEnabled, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalCompletionsTable extends LocalCompletions
    with TableInfo<$LocalCompletionsTable, LocalCompletionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalCompletionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitIdMeta = const VerificationMeta(
    'habitId',
  );
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    habitId,
    completedAt,
    note,
    count,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_completions';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalCompletionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(
        _habitIdMeta,
        habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalCompletionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalCompletionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit_id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $LocalCompletionsTable createAlias(String alias) {
    return $LocalCompletionsTable(attachedDatabase, alias);
  }
}

class LocalCompletionData extends DataClass
    implements Insertable<LocalCompletionData> {
  final String id;
  final String habitId;
  final DateTime completedAt;
  final String? note;
  final int count;
  final bool isSynced;
  const LocalCompletionData({
    required this.id,
    required this.habitId,
    required this.completedAt,
    this.note,
    required this.count,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_id'] = Variable<String>(habitId);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['count'] = Variable<int>(count);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  LocalCompletionsCompanion toCompanion(bool nullToAbsent) {
    return LocalCompletionsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      completedAt: Value(completedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      count: Value(count),
      isSynced: Value(isSynced),
    );
  }

  factory LocalCompletionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalCompletionData(
      id: serializer.fromJson<String>(json['id']),
      habitId: serializer.fromJson<String>(json['habitId']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      note: serializer.fromJson<String?>(json['note']),
      count: serializer.fromJson<int>(json['count']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitId': serializer.toJson<String>(habitId),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'note': serializer.toJson<String?>(note),
      'count': serializer.toJson<int>(count),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  LocalCompletionData copyWith({
    String? id,
    String? habitId,
    DateTime? completedAt,
    Value<String?> note = const Value.absent(),
    int? count,
    bool? isSynced,
  }) => LocalCompletionData(
    id: id ?? this.id,
    habitId: habitId ?? this.habitId,
    completedAt: completedAt ?? this.completedAt,
    note: note.present ? note.value : this.note,
    count: count ?? this.count,
    isSynced: isSynced ?? this.isSynced,
  );
  LocalCompletionData copyWithCompanion(LocalCompletionsCompanion data) {
    return LocalCompletionData(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      note: data.note.present ? data.note.value : this.note,
      count: data.count.present ? data.count.value : this.count,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalCompletionData(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('count: $count, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitId, completedAt, note, count, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalCompletionData &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.completedAt == this.completedAt &&
          other.note == this.note &&
          other.count == this.count &&
          other.isSynced == this.isSynced);
}

class LocalCompletionsCompanion extends UpdateCompanion<LocalCompletionData> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<DateTime> completedAt;
  final Value<String?> note;
  final Value<int> count;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const LocalCompletionsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.count = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalCompletionsCompanion.insert({
    required String id,
    required String habitId,
    required DateTime completedAt,
    this.note = const Value.absent(),
    this.count = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitId = Value(habitId),
       completedAt = Value(completedAt);
  static Insertable<LocalCompletionData> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<DateTime>? completedAt,
    Expression<String>? note,
    Expression<int>? count,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (completedAt != null) 'completed_at': completedAt,
      if (note != null) 'note': note,
      if (count != null) 'count': count,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalCompletionsCompanion copyWith({
    Value<String>? id,
    Value<String>? habitId,
    Value<DateTime>? completedAt,
    Value<String?>? note,
    Value<int>? count,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return LocalCompletionsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      count: count ?? this.count,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalCompletionsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('count: $count, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalScreenTimeTable extends LocalScreenTime
    with TableInfo<$LocalScreenTimeTable, LocalScreenTimeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalScreenTimeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appNameMeta = const VerificationMeta(
    'appName',
  );
  @override
  late final GeneratedColumn<String> appName = GeneratedColumn<String>(
    'app_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usageMinutesMeta = const VerificationMeta(
    'usageMinutes',
  );
  @override
  late final GeneratedColumn<int> usageMinutes = GeneratedColumn<int>(
    'usage_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageName,
    appName,
    usageMinutes,
    category,
    date,
    isSynced,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_screen_time';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalScreenTimeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('app_name')) {
      context.handle(
        _appNameMeta,
        appName.isAcceptableOrUnknown(data['app_name']!, _appNameMeta),
      );
    } else if (isInserting) {
      context.missing(_appNameMeta);
    }
    if (data.containsKey('usage_minutes')) {
      context.handle(
        _usageMinutesMeta,
        usageMinutes.isAcceptableOrUnknown(
          data['usage_minutes']!,
          _usageMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_usageMinutesMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalScreenTimeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalScreenTimeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      )!,
      appName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app_name'],
      )!,
      usageMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_minutes'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LocalScreenTimeTable createAlias(String alias) {
    return $LocalScreenTimeTable(attachedDatabase, alias);
  }
}

class LocalScreenTimeData extends DataClass
    implements Insertable<LocalScreenTimeData> {
  final int id;
  final String packageName;
  final String appName;
  final int usageMinutes;
  final String category;
  final DateTime date;
  final bool isSynced;
  final DateTime createdAt;
  const LocalScreenTimeData({
    required this.id,
    required this.packageName,
    required this.appName,
    required this.usageMinutes,
    required this.category,
    required this.date,
    required this.isSynced,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['package_name'] = Variable<String>(packageName);
    map['app_name'] = Variable<String>(appName);
    map['usage_minutes'] = Variable<int>(usageMinutes);
    map['category'] = Variable<String>(category);
    map['date'] = Variable<DateTime>(date);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LocalScreenTimeCompanion toCompanion(bool nullToAbsent) {
    return LocalScreenTimeCompanion(
      id: Value(id),
      packageName: Value(packageName),
      appName: Value(appName),
      usageMinutes: Value(usageMinutes),
      category: Value(category),
      date: Value(date),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
    );
  }

  factory LocalScreenTimeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalScreenTimeData(
      id: serializer.fromJson<int>(json['id']),
      packageName: serializer.fromJson<String>(json['packageName']),
      appName: serializer.fromJson<String>(json['appName']),
      usageMinutes: serializer.fromJson<int>(json['usageMinutes']),
      category: serializer.fromJson<String>(json['category']),
      date: serializer.fromJson<DateTime>(json['date']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'packageName': serializer.toJson<String>(packageName),
      'appName': serializer.toJson<String>(appName),
      'usageMinutes': serializer.toJson<int>(usageMinutes),
      'category': serializer.toJson<String>(category),
      'date': serializer.toJson<DateTime>(date),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalScreenTimeData copyWith({
    int? id,
    String? packageName,
    String? appName,
    int? usageMinutes,
    String? category,
    DateTime? date,
    bool? isSynced,
    DateTime? createdAt,
  }) => LocalScreenTimeData(
    id: id ?? this.id,
    packageName: packageName ?? this.packageName,
    appName: appName ?? this.appName,
    usageMinutes: usageMinutes ?? this.usageMinutes,
    category: category ?? this.category,
    date: date ?? this.date,
    isSynced: isSynced ?? this.isSynced,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalScreenTimeData copyWithCompanion(LocalScreenTimeCompanion data) {
    return LocalScreenTimeData(
      id: data.id.present ? data.id.value : this.id,
      packageName: data.packageName.present
          ? data.packageName.value
          : this.packageName,
      appName: data.appName.present ? data.appName.value : this.appName,
      usageMinutes: data.usageMinutes.present
          ? data.usageMinutes.value
          : this.usageMinutes,
      category: data.category.present ? data.category.value : this.category,
      date: data.date.present ? data.date.value : this.date,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalScreenTimeData(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('appName: $appName, ')
          ..write('usageMinutes: $usageMinutes, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packageName,
    appName,
    usageMinutes,
    category,
    date,
    isSynced,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalScreenTimeData &&
          other.id == this.id &&
          other.packageName == this.packageName &&
          other.appName == this.appName &&
          other.usageMinutes == this.usageMinutes &&
          other.category == this.category &&
          other.date == this.date &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class LocalScreenTimeCompanion extends UpdateCompanion<LocalScreenTimeData> {
  final Value<int> id;
  final Value<String> packageName;
  final Value<String> appName;
  final Value<int> usageMinutes;
  final Value<String> category;
  final Value<DateTime> date;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  const LocalScreenTimeCompanion({
    this.id = const Value.absent(),
    this.packageName = const Value.absent(),
    this.appName = const Value.absent(),
    this.usageMinutes = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LocalScreenTimeCompanion.insert({
    this.id = const Value.absent(),
    required String packageName,
    required String appName,
    required int usageMinutes,
    required String category,
    required DateTime date,
    this.isSynced = const Value.absent(),
    required DateTime createdAt,
  }) : packageName = Value(packageName),
       appName = Value(appName),
       usageMinutes = Value(usageMinutes),
       category = Value(category),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<LocalScreenTimeData> custom({
    Expression<int>? id,
    Expression<String>? packageName,
    Expression<String>? appName,
    Expression<int>? usageMinutes,
    Expression<String>? category,
    Expression<DateTime>? date,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageName != null) 'package_name': packageName,
      if (appName != null) 'app_name': appName,
      if (usageMinutes != null) 'usage_minutes': usageMinutes,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LocalScreenTimeCompanion copyWith({
    Value<int>? id,
    Value<String>? packageName,
    Value<String>? appName,
    Value<int>? usageMinutes,
    Value<String>? category,
    Value<DateTime>? date,
    Value<bool>? isSynced,
    Value<DateTime>? createdAt,
  }) {
    return LocalScreenTimeCompanion(
      id: id ?? this.id,
      packageName: packageName ?? this.packageName,
      appName: appName ?? this.appName,
      usageMinutes: usageMinutes ?? this.usageMinutes,
      category: category ?? this.category,
      date: date ?? this.date,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (appName.present) {
      map['app_name'] = Variable<String>(appName.value);
    }
    if (usageMinutes.present) {
      map['usage_minutes'] = Variable<int>(usageMinutes.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalScreenTimeCompanion(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('appName: $appName, ')
          ..write('usageMinutes: $usageMinutes, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LocalScreenTimeLimitsTable extends LocalScreenTimeLimits
    with TableInfo<$LocalScreenTimeLimitsTable, LocalScreenTimeLimitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalScreenTimeLimitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dailyLimitMinutesMeta = const VerificationMeta(
    'dailyLimitMinutes',
  );
  @override
  late final GeneratedColumn<int> dailyLimitMinutes = GeneratedColumn<int>(
    'daily_limit_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    packageName,
    category,
    dailyLimitMinutes,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_screen_time_limits';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalScreenTimeLimitData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('daily_limit_minutes')) {
      context.handle(
        _dailyLimitMinutesMeta,
        dailyLimitMinutes.isAcceptableOrUnknown(
          data['daily_limit_minutes']!,
          _dailyLimitMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dailyLimitMinutesMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalScreenTimeLimitData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalScreenTimeLimitData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      dailyLimitMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_limit_minutes'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LocalScreenTimeLimitsTable createAlias(String alias) {
    return $LocalScreenTimeLimitsTable(attachedDatabase, alias);
  }
}

class LocalScreenTimeLimitData extends DataClass
    implements Insertable<LocalScreenTimeLimitData> {
  final String id;
  final String? packageName;
  final String? category;
  final int dailyLimitMinutes;
  final bool isActive;
  final DateTime createdAt;
  const LocalScreenTimeLimitData({
    required this.id,
    this.packageName,
    this.category,
    required this.dailyLimitMinutes,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || packageName != null) {
      map['package_name'] = Variable<String>(packageName);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['daily_limit_minutes'] = Variable<int>(dailyLimitMinutes);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LocalScreenTimeLimitsCompanion toCompanion(bool nullToAbsent) {
    return LocalScreenTimeLimitsCompanion(
      id: Value(id),
      packageName: packageName == null && nullToAbsent
          ? const Value.absent()
          : Value(packageName),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      dailyLimitMinutes: Value(dailyLimitMinutes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory LocalScreenTimeLimitData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalScreenTimeLimitData(
      id: serializer.fromJson<String>(json['id']),
      packageName: serializer.fromJson<String?>(json['packageName']),
      category: serializer.fromJson<String?>(json['category']),
      dailyLimitMinutes: serializer.fromJson<int>(json['dailyLimitMinutes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'packageName': serializer.toJson<String?>(packageName),
      'category': serializer.toJson<String?>(category),
      'dailyLimitMinutes': serializer.toJson<int>(dailyLimitMinutes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LocalScreenTimeLimitData copyWith({
    String? id,
    Value<String?> packageName = const Value.absent(),
    Value<String?> category = const Value.absent(),
    int? dailyLimitMinutes,
    bool? isActive,
    DateTime? createdAt,
  }) => LocalScreenTimeLimitData(
    id: id ?? this.id,
    packageName: packageName.present ? packageName.value : this.packageName,
    category: category.present ? category.value : this.category,
    dailyLimitMinutes: dailyLimitMinutes ?? this.dailyLimitMinutes,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  LocalScreenTimeLimitData copyWithCompanion(
    LocalScreenTimeLimitsCompanion data,
  ) {
    return LocalScreenTimeLimitData(
      id: data.id.present ? data.id.value : this.id,
      packageName: data.packageName.present
          ? data.packageName.value
          : this.packageName,
      category: data.category.present ? data.category.value : this.category,
      dailyLimitMinutes: data.dailyLimitMinutes.present
          ? data.dailyLimitMinutes.value
          : this.dailyLimitMinutes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalScreenTimeLimitData(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('category: $category, ')
          ..write('dailyLimitMinutes: $dailyLimitMinutes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    packageName,
    category,
    dailyLimitMinutes,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalScreenTimeLimitData &&
          other.id == this.id &&
          other.packageName == this.packageName &&
          other.category == this.category &&
          other.dailyLimitMinutes == this.dailyLimitMinutes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class LocalScreenTimeLimitsCompanion
    extends UpdateCompanion<LocalScreenTimeLimitData> {
  final Value<String> id;
  final Value<String?> packageName;
  final Value<String?> category;
  final Value<int> dailyLimitMinutes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LocalScreenTimeLimitsCompanion({
    this.id = const Value.absent(),
    this.packageName = const Value.absent(),
    this.category = const Value.absent(),
    this.dailyLimitMinutes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalScreenTimeLimitsCompanion.insert({
    required String id,
    this.packageName = const Value.absent(),
    this.category = const Value.absent(),
    required int dailyLimitMinutes,
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dailyLimitMinutes = Value(dailyLimitMinutes),
       createdAt = Value(createdAt);
  static Insertable<LocalScreenTimeLimitData> custom({
    Expression<String>? id,
    Expression<String>? packageName,
    Expression<String>? category,
    Expression<int>? dailyLimitMinutes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (packageName != null) 'package_name': packageName,
      if (category != null) 'category': category,
      if (dailyLimitMinutes != null) 'daily_limit_minutes': dailyLimitMinutes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalScreenTimeLimitsCompanion copyWith({
    Value<String>? id,
    Value<String?>? packageName,
    Value<String?>? category,
    Value<int>? dailyLimitMinutes,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LocalScreenTimeLimitsCompanion(
      id: id ?? this.id,
      packageName: packageName ?? this.packageName,
      category: category ?? this.category,
      dailyLimitMinutes: dailyLimitMinutes ?? this.dailyLimitMinutes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (dailyLimitMinutes.present) {
      map['daily_limit_minutes'] = Variable<int>(dailyLimitMinutes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalScreenTimeLimitsCompanion(')
          ..write('id: $id, ')
          ..write('packageName: $packageName, ')
          ..write('category: $category, ')
          ..write('dailyLimitMinutes: $dailyLimitMinutes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    action,
    payload,
    retryCount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueItemData extends DataClass
    implements Insertable<SyncQueueItemData> {
  final int id;
  final String entityType;
  final String entityId;
  final String action;
  final String payload;
  final int retryCount;
  final DateTime createdAt;
  const SyncQueueItemData({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.action,
    required this.payload,
    required this.retryCount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['action'] = Variable<String>(action);
    map['payload'] = Variable<String>(payload);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      action: Value(action),
      payload: Value(payload),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueItemData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      action: serializer.fromJson<String>(json['action']),
      payload: serializer.fromJson<String>(json['payload']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'action': serializer.toJson<String>(action),
      'payload': serializer.toJson<String>(payload),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncQueueItemData copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? action,
    String? payload,
    int? retryCount,
    DateTime? createdAt,
  }) => SyncQueueItemData(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    action: action ?? this.action,
    payload: payload ?? this.payload,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
  );
  SyncQueueItemData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueItemData(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      action: data.action.present ? data.action.value : this.action,
      payload: data.payload.present ? data.payload.value : this.payload,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueItemData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    action,
    payload,
    retryCount,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueItemData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.action == this.action &&
          other.payload == this.payload &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueItemData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> action;
  final Value<String> payload;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.action = const Value.absent(),
    this.payload = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String action,
    required String payload,
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       action = Value(action),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueItemData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? action,
    Expression<String>? payload,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (action != null) 'action': action,
      if (payload != null) 'payload': payload,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? action,
    Value<String>? payload,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      payload: payload ?? this.payload,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalHabitsTable localHabits = $LocalHabitsTable(this);
  late final $LocalCompletionsTable localCompletions = $LocalCompletionsTable(
    this,
  );
  late final $LocalScreenTimeTable localScreenTime = $LocalScreenTimeTable(
    this,
  );
  late final $LocalScreenTimeLimitsTable localScreenTimeLimits =
      $LocalScreenTimeLimitsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final HabitDao habitDao = HabitDao(this as AppDatabase);
  late final CompletionDao completionDao = CompletionDao(this as AppDatabase);
  late final ScreenTimeDao screenTimeDao = ScreenTimeDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localHabits,
    localCompletions,
    localScreenTime,
    localScreenTimeLimits,
    syncQueue,
  ];
}

typedef $$LocalHabitsTableCreateCompanionBuilder =
    LocalHabitsCompanion Function({
      required String id,
      required String userId,
      required String title,
      Value<String?> description,
      Value<String> emoji,
      Value<String> color,
      Value<String> frequency,
      Value<String?> customDays,
      Value<int> targetCount,
      Value<String?> category,
      Value<bool> reminderEnabled,
      Value<String?> reminderTime,
      Value<int> sortOrder,
      Value<bool> isArchived,
      Value<bool> isSynced,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LocalHabitsTableUpdateCompanionBuilder =
    LocalHabitsCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> title,
      Value<String?> description,
      Value<String> emoji,
      Value<String> color,
      Value<String> frequency,
      Value<String?> customDays,
      Value<int> targetCount,
      Value<String?> category,
      Value<bool> reminderEnabled,
      Value<String?> reminderTime,
      Value<int> sortOrder,
      Value<bool> isArchived,
      Value<bool> isSynced,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$LocalHabitsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalHabitsTable> {
  $$LocalHabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalHabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalHabitsTable> {
  $$LocalHabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalHabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalHabitsTable> {
  $$LocalHabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get reminderEnabled => $composableBuilder(
    column: $table.reminderEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$LocalHabitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalHabitsTable,
          LocalHabitData,
          $$LocalHabitsTableFilterComposer,
          $$LocalHabitsTableOrderingComposer,
          $$LocalHabitsTableAnnotationComposer,
          $$LocalHabitsTableCreateCompanionBuilder,
          $$LocalHabitsTableUpdateCompanionBuilder,
          (
            LocalHabitData,
            BaseReferences<_$AppDatabase, $LocalHabitsTable, LocalHabitData>,
          ),
          LocalHabitData,
          PrefetchHooks Function()
        > {
  $$LocalHabitsTableTableManager(_$AppDatabase db, $LocalHabitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalHabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalHabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalHabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> customDays = const Value.absent(),
                Value<int> targetCount = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<bool> reminderEnabled = const Value.absent(),
                Value<String?> reminderTime = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalHabitsCompanion(
                id: id,
                userId: userId,
                title: title,
                description: description,
                emoji: emoji,
                color: color,
                frequency: frequency,
                customDays: customDays,
                targetCount: targetCount,
                category: category,
                reminderEnabled: reminderEnabled,
                reminderTime: reminderTime,
                sortOrder: sortOrder,
                isArchived: isArchived,
                isSynced: isSynced,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> customDays = const Value.absent(),
                Value<int> targetCount = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<bool> reminderEnabled = const Value.absent(),
                Value<String?> reminderTime = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalHabitsCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                description: description,
                emoji: emoji,
                color: color,
                frequency: frequency,
                customDays: customDays,
                targetCount: targetCount,
                category: category,
                reminderEnabled: reminderEnabled,
                reminderTime: reminderTime,
                sortOrder: sortOrder,
                isArchived: isArchived,
                isSynced: isSynced,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalHabitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalHabitsTable,
      LocalHabitData,
      $$LocalHabitsTableFilterComposer,
      $$LocalHabitsTableOrderingComposer,
      $$LocalHabitsTableAnnotationComposer,
      $$LocalHabitsTableCreateCompanionBuilder,
      $$LocalHabitsTableUpdateCompanionBuilder,
      (
        LocalHabitData,
        BaseReferences<_$AppDatabase, $LocalHabitsTable, LocalHabitData>,
      ),
      LocalHabitData,
      PrefetchHooks Function()
    >;
typedef $$LocalCompletionsTableCreateCompanionBuilder =
    LocalCompletionsCompanion Function({
      required String id,
      required String habitId,
      required DateTime completedAt,
      Value<String?> note,
      Value<int> count,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$LocalCompletionsTableUpdateCompanionBuilder =
    LocalCompletionsCompanion Function({
      Value<String> id,
      Value<String> habitId,
      Value<DateTime> completedAt,
      Value<String?> note,
      Value<int> count,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$LocalCompletionsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalCompletionsTable> {
  $$LocalCompletionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get habitId => $composableBuilder(
    column: $table.habitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalCompletionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalCompletionsTable> {
  $$LocalCompletionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get habitId => $composableBuilder(
    column: $table.habitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalCompletionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalCompletionsTable> {
  $$LocalCompletionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get habitId =>
      $composableBuilder(column: $table.habitId, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$LocalCompletionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalCompletionsTable,
          LocalCompletionData,
          $$LocalCompletionsTableFilterComposer,
          $$LocalCompletionsTableOrderingComposer,
          $$LocalCompletionsTableAnnotationComposer,
          $$LocalCompletionsTableCreateCompanionBuilder,
          $$LocalCompletionsTableUpdateCompanionBuilder,
          (
            LocalCompletionData,
            BaseReferences<
              _$AppDatabase,
              $LocalCompletionsTable,
              LocalCompletionData
            >,
          ),
          LocalCompletionData,
          PrefetchHooks Function()
        > {
  $$LocalCompletionsTableTableManager(
    _$AppDatabase db,
    $LocalCompletionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalCompletionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalCompletionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalCompletionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitId = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalCompletionsCompanion(
                id: id,
                habitId: habitId,
                completedAt: completedAt,
                note: note,
                count: count,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitId,
                required DateTime completedAt,
                Value<String?> note = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalCompletionsCompanion.insert(
                id: id,
                habitId: habitId,
                completedAt: completedAt,
                note: note,
                count: count,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalCompletionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalCompletionsTable,
      LocalCompletionData,
      $$LocalCompletionsTableFilterComposer,
      $$LocalCompletionsTableOrderingComposer,
      $$LocalCompletionsTableAnnotationComposer,
      $$LocalCompletionsTableCreateCompanionBuilder,
      $$LocalCompletionsTableUpdateCompanionBuilder,
      (
        LocalCompletionData,
        BaseReferences<
          _$AppDatabase,
          $LocalCompletionsTable,
          LocalCompletionData
        >,
      ),
      LocalCompletionData,
      PrefetchHooks Function()
    >;
typedef $$LocalScreenTimeTableCreateCompanionBuilder =
    LocalScreenTimeCompanion Function({
      Value<int> id,
      required String packageName,
      required String appName,
      required int usageMinutes,
      required String category,
      required DateTime date,
      Value<bool> isSynced,
      required DateTime createdAt,
    });
typedef $$LocalScreenTimeTableUpdateCompanionBuilder =
    LocalScreenTimeCompanion Function({
      Value<int> id,
      Value<String> packageName,
      Value<String> appName,
      Value<int> usageMinutes,
      Value<String> category,
      Value<DateTime> date,
      Value<bool> isSynced,
      Value<DateTime> createdAt,
    });

class $$LocalScreenTimeTableFilterComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeTable> {
  $$LocalScreenTimeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appName => $composableBuilder(
    column: $table.appName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageMinutes => $composableBuilder(
    column: $table.usageMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalScreenTimeTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeTable> {
  $$LocalScreenTimeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appName => $composableBuilder(
    column: $table.appName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageMinutes => $composableBuilder(
    column: $table.usageMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalScreenTimeTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeTable> {
  $$LocalScreenTimeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get appName =>
      $composableBuilder(column: $table.appName, builder: (column) => column);

  GeneratedColumn<int> get usageMinutes => $composableBuilder(
    column: $table.usageMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalScreenTimeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalScreenTimeTable,
          LocalScreenTimeData,
          $$LocalScreenTimeTableFilterComposer,
          $$LocalScreenTimeTableOrderingComposer,
          $$LocalScreenTimeTableAnnotationComposer,
          $$LocalScreenTimeTableCreateCompanionBuilder,
          $$LocalScreenTimeTableUpdateCompanionBuilder,
          (
            LocalScreenTimeData,
            BaseReferences<
              _$AppDatabase,
              $LocalScreenTimeTable,
              LocalScreenTimeData
            >,
          ),
          LocalScreenTimeData,
          PrefetchHooks Function()
        > {
  $$LocalScreenTimeTableTableManager(
    _$AppDatabase db,
    $LocalScreenTimeTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalScreenTimeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalScreenTimeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalScreenTimeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> packageName = const Value.absent(),
                Value<String> appName = const Value.absent(),
                Value<int> usageMinutes = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LocalScreenTimeCompanion(
                id: id,
                packageName: packageName,
                appName: appName,
                usageMinutes: usageMinutes,
                category: category,
                date: date,
                isSynced: isSynced,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String packageName,
                required String appName,
                required int usageMinutes,
                required String category,
                required DateTime date,
                Value<bool> isSynced = const Value.absent(),
                required DateTime createdAt,
              }) => LocalScreenTimeCompanion.insert(
                id: id,
                packageName: packageName,
                appName: appName,
                usageMinutes: usageMinutes,
                category: category,
                date: date,
                isSynced: isSynced,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalScreenTimeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalScreenTimeTable,
      LocalScreenTimeData,
      $$LocalScreenTimeTableFilterComposer,
      $$LocalScreenTimeTableOrderingComposer,
      $$LocalScreenTimeTableAnnotationComposer,
      $$LocalScreenTimeTableCreateCompanionBuilder,
      $$LocalScreenTimeTableUpdateCompanionBuilder,
      (
        LocalScreenTimeData,
        BaseReferences<
          _$AppDatabase,
          $LocalScreenTimeTable,
          LocalScreenTimeData
        >,
      ),
      LocalScreenTimeData,
      PrefetchHooks Function()
    >;
typedef $$LocalScreenTimeLimitsTableCreateCompanionBuilder =
    LocalScreenTimeLimitsCompanion Function({
      required String id,
      Value<String?> packageName,
      Value<String?> category,
      required int dailyLimitMinutes,
      Value<bool> isActive,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$LocalScreenTimeLimitsTableUpdateCompanionBuilder =
    LocalScreenTimeLimitsCompanion Function({
      Value<String> id,
      Value<String?> packageName,
      Value<String?> category,
      Value<int> dailyLimitMinutes,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$LocalScreenTimeLimitsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeLimitsTable> {
  $$LocalScreenTimeLimitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyLimitMinutes => $composableBuilder(
    column: $table.dailyLimitMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalScreenTimeLimitsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeLimitsTable> {
  $$LocalScreenTimeLimitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyLimitMinutes => $composableBuilder(
    column: $table.dailyLimitMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalScreenTimeLimitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalScreenTimeLimitsTable> {
  $$LocalScreenTimeLimitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get dailyLimitMinutes => $composableBuilder(
    column: $table.dailyLimitMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LocalScreenTimeLimitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalScreenTimeLimitsTable,
          LocalScreenTimeLimitData,
          $$LocalScreenTimeLimitsTableFilterComposer,
          $$LocalScreenTimeLimitsTableOrderingComposer,
          $$LocalScreenTimeLimitsTableAnnotationComposer,
          $$LocalScreenTimeLimitsTableCreateCompanionBuilder,
          $$LocalScreenTimeLimitsTableUpdateCompanionBuilder,
          (
            LocalScreenTimeLimitData,
            BaseReferences<
              _$AppDatabase,
              $LocalScreenTimeLimitsTable,
              LocalScreenTimeLimitData
            >,
          ),
          LocalScreenTimeLimitData,
          PrefetchHooks Function()
        > {
  $$LocalScreenTimeLimitsTableTableManager(
    _$AppDatabase db,
    $LocalScreenTimeLimitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalScreenTimeLimitsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$LocalScreenTimeLimitsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalScreenTimeLimitsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> packageName = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> dailyLimitMinutes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalScreenTimeLimitsCompanion(
                id: id,
                packageName: packageName,
                category: category,
                dailyLimitMinutes: dailyLimitMinutes,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> packageName = const Value.absent(),
                Value<String?> category = const Value.absent(),
                required int dailyLimitMinutes,
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LocalScreenTimeLimitsCompanion.insert(
                id: id,
                packageName: packageName,
                category: category,
                dailyLimitMinutes: dailyLimitMinutes,
                isActive: isActive,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalScreenTimeLimitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalScreenTimeLimitsTable,
      LocalScreenTimeLimitData,
      $$LocalScreenTimeLimitsTableFilterComposer,
      $$LocalScreenTimeLimitsTableOrderingComposer,
      $$LocalScreenTimeLimitsTableAnnotationComposer,
      $$LocalScreenTimeLimitsTableCreateCompanionBuilder,
      $$LocalScreenTimeLimitsTableUpdateCompanionBuilder,
      (
        LocalScreenTimeLimitData,
        BaseReferences<
          _$AppDatabase,
          $LocalScreenTimeLimitsTable,
          LocalScreenTimeLimitData
        >,
      ),
      LocalScreenTimeLimitData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityId,
      required String action,
      required String payload,
      Value<int> retryCount,
      required DateTime createdAt,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> action,
      Value<String> payload,
      Value<int> retryCount,
      Value<DateTime> createdAt,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueItemData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueItemData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueItemData>,
          ),
          SyncQueueItemData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                action: action,
                payload: payload,
                retryCount: retryCount,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityId,
                required String action,
                required String payload,
                Value<int> retryCount = const Value.absent(),
                required DateTime createdAt,
              }) => SyncQueueCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                action: action,
                payload: payload,
                retryCount: retryCount,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueItemData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueItemData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueItemData>,
      ),
      SyncQueueItemData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalHabitsTableTableManager get localHabits =>
      $$LocalHabitsTableTableManager(_db, _db.localHabits);
  $$LocalCompletionsTableTableManager get localCompletions =>
      $$LocalCompletionsTableTableManager(_db, _db.localCompletions);
  $$LocalScreenTimeTableTableManager get localScreenTime =>
      $$LocalScreenTimeTableTableManager(_db, _db.localScreenTime);
  $$LocalScreenTimeLimitsTableTableManager get localScreenTimeLimits =>
      $$LocalScreenTimeLimitsTableTableManager(_db, _db.localScreenTimeLimits);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
}
