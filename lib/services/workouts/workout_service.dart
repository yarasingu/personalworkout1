import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personalworkout/models/workout_model.dart';

class WorkoutService {
  final FirebaseFirestore _workouts = FirebaseFirestore.instance;

  Future<void> addWorkout(Workout workout) async {
    await _workouts.collection('workouts').add({
      'name': workout.name,
      'value': workout.value,
    });
  }

  Stream<List<Workout>> getWorkouts() {
    return _workouts.collection('workouts').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Workout(
          name: doc['name'],
          value: doc['value'],
        );
      }).toList();
    });
  }
}
