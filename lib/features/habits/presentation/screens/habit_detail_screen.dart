import 'package:flutter/material.dart';

class HabitDetailScreen extends StatelessWidget {
  final String habitId;
  const HabitDetailScreen({super.key, required this.habitId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Habit Detail Screen\nID: $habitId')),
    );
  }
}
