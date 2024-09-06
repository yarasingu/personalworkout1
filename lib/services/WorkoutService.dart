import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Workout {
  final int id;
  final String name;
  final int value;
  final DateTime date;

  Workout(
      {required this.id,
      required this.name,
      required this.value,
      required this.date});
}

class WorkoutService with ChangeNotifier {
  final List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  Future<void> markWorkoutDone(Workout workout, int value) async {
    _workouts.add(Workout(
      id: workout.id,
      name: workout.name,
      value: value,
      date: DateTime.now(),
    ));
    notifyListeners();
    await _saveWorkouts();
  }

  List<Workout> getWorkoutsByDate(DateTime date) {
    return _workouts
        .where((w) =>
            w.date.year == date.year &&
            w.date.month == date.month &&
            w.date.day == date.day)
        .toList();
  }

  List<Workout> getAllWorkouts() {
    return _workouts;
  }

  Future<void> _saveWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    // Serialize and save workouts to SharedPreferences or a file
  }
}
