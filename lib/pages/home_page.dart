// import 'package:flutter/material.dart';
// import 'package:personalworkout/components/my_drawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("H O M E"),
//         foregroundColor: Theme.of(context).colorScheme.primary,
//         centerTitle: true,
//       ),
//       drawer: MyDrawer(),
//       body: Column(
//         children: [

//         ],
//       ),
//     );
//   }
// }/

import 'package:flutter/material.dart';
import 'package:personalworkout/components/my_drawer.dart';

import 'package:personalworkout/models/workout_model.dart';
import 'package:personalworkout/services/workouts/workout_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorkoutService _firestoreService = WorkoutService();

  void _showWorkoutDialog(Workout workout) {
    showDialog(
      context: context,
      builder: (context) {
        int value = workout.value;

        return AlertDialog(
          title: Text('Mark ${workout.name} as Done'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Assign a value (1-100):'),
              Slider(
                value: value.toDouble(),
                min: 1,
                max: 100,
                divisions: 99,
                onChanged: (newValue) {
                  setState(() {
                    value = newValue.toInt();
                  });
                },
              ),
              Text('$value'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  workout.value = value;
                });
                _firestoreService.addWorkout(workout);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E"),
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: StreamBuilder<List<Workout>>(
        stream: _firestoreService.getWorkouts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final workouts = snapshot.data ?? [];

          return ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return ListTile(
                title: Text(workout.name),
                subtitle: Text('Value: ${workout.value}'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showWorkoutDialog(workout),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
