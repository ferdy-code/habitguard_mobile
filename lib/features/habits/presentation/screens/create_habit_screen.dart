import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/remote/habit_remote_source.dart';
import '../../domain/entities/habit.dart';
import '../providers/habit_provider.dart';

class CreateHabitScreen extends ConsumerStatefulWidget {
  final Habit? editingHabit;
  const CreateHabitScreen({super.key, this.editingHabit});

  @override
  ConsumerState<CreateHabitScreen> createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends ConsumerState<CreateHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleCtrl;
  late final TextEditingController _descCtrl;
  bool _submitted = false;
  bool _isLoading = false;

  String _emoji = '⭐';
  String _color = '#4CAF50';
  HabitFrequency _frequency = HabitFrequency.daily;
  int? _customDay;
  int _targetCount = 1;
  String? _category;
  bool _reminderEnabled = false;
  TimeOfDay? _reminderTime;

  static const _colors = [
    '#4CAF50',
    '#2196F3',
    '#FF9800',
    '#F44336',
    '#9C27B0',
    '#FF5722',
    '#00BCD4',
    '#795548',
  ];

  static const _emojis = [
    '🏃', '💪', '🧘', '🚶', '🚴', '🏊', '⚽', '🎯', '📚', '✍️',
    '🎵', '🎨', '💊', '🥗', '💧', '😴', '🌅', '🧹', '💰', '🚭',
    '🍎', '🥦', '🏋️', '🤸', '🎤', '📝', '🧠', '❤️', '⭐', '🌟',
  ];

  static const _templates = [
    (emoji: '🏃', title: 'Olahraga',    color: '#4CAF50', category: 'Kesehatan'),
    (emoji: '📚', title: 'Baca Buku',   color: '#2196F3', category: 'Pendidikan'),
    (emoji: '🧘', title: 'Meditasi',    color: '#9C27B0', category: 'Mindfulness'),
    (emoji: '💧', title: 'Minum Air',   color: '#00BCD4', category: 'Kesehatan'),
    (emoji: '😴', title: 'Tidur Cukup', color: '#795548', category: 'Kesehatan'),
    (emoji: '✍️', title: 'Jurnal',      color: '#FF9800', category: 'Refleksi'),
    (emoji: '💊', title: 'Vitamin',     color: '#F44336', category: 'Kesehatan'),
    (emoji: '🚶', title: 'Jalan Kaki',  color: '#4CAF50', category: 'Olahraga'),
  ];

  static const _dayNames = [
    (value: 1, label: 'Sen'),
    (value: 2, label: 'Sel'),
    (value: 3, label: 'Rab'),
    (value: 4, label: 'Kam'),
    (value: 5, label: 'Jum'),
    (value: 6, label: 'Sab'),
    (value: 7, label: 'Min'),
  ];
  static const _categories = [
    'Kesehatan',
    'Pendidikan',
    'Produktivitas',
    'Mindfulness',
    'Olahraga',
    'Keuangan',
    'Sosial',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    final h = widget.editingHabit;
    _titleCtrl = TextEditingController(text: h?.title ?? '');
    _descCtrl = TextEditingController(text: h?.description ?? '');
    if (h != null) {
      _emoji = h.emoji;
      _color = h.color;
      _frequency = h.frequency;
      _customDay = h.customDays;
      _targetCount = h.targetCount;
      _category = h.category;
      _reminderEnabled = h.reminderEnabled;
      if (h.reminderTime != null) {
        final parts = h.reminderTime!.split(':');
        _reminderTime = TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _applyTemplate(
    ({String emoji, String title, String color, String category}) t,
  ) {
    setState(() {
      _titleCtrl.text = t.title;
      _emoji = t.emoji;
      _color = t.color;
      _category = t.category;
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => _reminderTime = picked);
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) return;
    if (_frequency == HabitFrequency.custom && _customDay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih 1 hari untuk kustom')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final reminderStr = _reminderEnabled && _reminderTime != null
        ? '${_reminderTime!.hour.toString().padLeft(2, '0')}:${_reminderTime!.minute.toString().padLeft(2, '0')}'
        : null;

    final notifier = ref.read(habitsListProvider.notifier);

    if (widget.editingHabit != null) {
      await notifier.updateHabit(
        widget.editingHabit!.id,
        UpdateHabitRequest(
          title: _titleCtrl.text.trim(),
          description: _descCtrl.text.trim().isEmpty
              ? null
              : _descCtrl.text.trim(),
          emoji: _emoji,
          color: _color,
          frequency: _frequency,
          customDays: _frequency == HabitFrequency.custom && _customDay != null
              ? _customDay!
              : null,
          targetCount: _targetCount,
          category: _category,
          reminderEnabled: _reminderEnabled,
          reminderTime: reminderStr,
        ),
      );
    } else {
      await notifier.createHabit(
        CreateHabitRequest(
          title: _titleCtrl.text.trim(),
          description: _descCtrl.text.trim().isEmpty
              ? null
              : _descCtrl.text.trim(),
          emoji: _emoji,
          color: _color,
          frequency: _frequency,
          customDays: _frequency == HabitFrequency.custom && _customDay != null
              ? _customDay!
              : null,
          targetCount: _targetCount,
          category: _category,
          reminderEnabled: _reminderEnabled,
          reminderTime: reminderStr,
        ),
      );
    }

    if (!mounted) return;
    setState(() => _isLoading = false);

    final state = ref.read(habitsListProvider);
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error.toString()),
          backgroundColor: AppColors.danger,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.editingHabit != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Habit' : 'Buat Habit Baru')),
      body: Form(
        key: _formKey,
        autovalidateMode: _submitted
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Template chips ──────────────────────────────────
            Text(
              'Mulai dari template',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _templates.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final t = _templates[i];
                  return GestureDetector(
                    onTap: () => _applyTemplate(t),
                    child: Container(
                      width: 68,
                      decoration: BoxDecoration(
                        color: colorFromHex(t.color).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorFromHex(t.color).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(t.emoji, style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 2),
                          Text(
                            t.title.split(' ').first,
                            style: const TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // ── Emoji + Color ────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Emoji picker button
                GestureDetector(
                  onTap: () => _showEmojiPicker(context),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: colorFromHex(_color).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorFromHex(_color).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Center(
                      child: Text(_emoji, style: const TextStyle(fontSize: 32)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Color picker
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Warna',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _colors.map((c) {
                          final sel = c == _color;
                          return GestureDetector(
                            onTap: () => setState(() => _color = c),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: colorFromHex(c),
                                shape: BoxShape.circle,
                                border: sel
                                    ? Border.all(
                                        color: Colors.white,
                                        width: 2.5,
                                      )
                                    : null,
                                boxShadow: sel
                                    ? [
                                        BoxShadow(
                                          color: colorFromHex(
                                            c,
                                          ).withValues(alpha: 0.5),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: sel
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : null,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Title ────────────────────────────────────────────
            TextFormField(
              controller: _titleCtrl,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Nama Habit *',
                prefixIcon: Icon(Icons.edit_outlined),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null,
            ),
            const SizedBox(height: 12),

            // ── Description ──────────────────────────────────────
            TextFormField(
              controller: _descCtrl,
              maxLines: 2,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Deskripsi (opsional)',
                prefixIcon: Icon(Icons.notes_outlined),
              ),
            ),
            const SizedBox(height: 16),

            // ── Frequency ────────────────────────────────────────
            Text('Frekuensi', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            SegmentedButton<HabitFrequency>(
              segments: const [
                ButtonSegment(
                  value: HabitFrequency.daily,
                  label: Text('Harian'),
                ),
                ButtonSegment(
                  value: HabitFrequency.weekly,
                  label: Text('Mingguan'),
                ),
                ButtonSegment(
                  value: HabitFrequency.custom,
                  label: Text('Kustom'),
                ),
              ],
              selected: {_frequency},
              onSelectionChanged: (s) => setState(() => _frequency = s.first),
            ),

            if (_frequency == HabitFrequency.custom) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                children: _dayNames.map((day) {
                  return FilterChip(
                    label: Text(day.label),
                    selected: _customDay == day.value,
                    onSelected: (_) => setState(
                      () => _customDay = _customDay == day.value
                          ? null
                          : day.value,
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),

            // ── Target count ─────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Target per hari',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () =>
                      setState(() => _targetCount = max(1, _targetCount - 1)),
                ),
                SizedBox(
                  width: 32,
                  child: Text(
                    '$_targetCount',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () =>
                      setState(() => _targetCount = min(99, _targetCount + 1)),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ── Category ─────────────────────────────────────────
            DropdownButtonFormField<String>(
              initialValue: _category,
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _category = v),
              decoration: const InputDecoration(
                labelText: 'Kategori (opsional)',
                prefixIcon: Icon(Icons.category_outlined),
              ),
            ),
            const SizedBox(height: 16),

            // ── Reminder ─────────────────────────────────────────
            SwitchListTile(
              title: const Text('Pengingat'),
              subtitle: _reminderEnabled && _reminderTime != null
                  ? Text('Setiap hari pukul ${_reminderTime!.format(context)}')
                  : null,
              value: _reminderEnabled,
              onChanged: (v) {
                setState(() => _reminderEnabled = v);
                if (v && _reminderTime == null) _pickTime();
              },
              contentPadding: EdgeInsets.zero,
            ),
            if (_reminderEnabled) ...[
              OutlinedButton.icon(
                onPressed: _pickTime,
                icon: const Icon(Icons.access_time),
                label: Text(
                  _reminderTime != null
                      ? 'Ubah waktu: ${_reminderTime!.format(context)}'
                      : 'Pilih waktu',
                ),
              ),
            ],
            const SizedBox(height: 32),

            // ── Submit ───────────────────────────────────────────
            ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.white,
                      ),
                    )
                  : Text(isEditing ? 'Simpan Perubahan' : 'Buat Habit'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Emoji', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: _emojis
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() => _emoji = e);
                        Navigator.pop(context);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: e == _emoji
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(e, style: const TextStyle(fontSize: 28)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
