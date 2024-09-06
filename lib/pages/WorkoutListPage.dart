import 'package:flutter/material.dart';
import 'package:personalworkout/services/WorkoutService.dart';
import 'package:provider/provider.dart';

class WorkoutListPage extends StatefulWidget {
  @override
  _WorkoutListPageState createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workout List')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _selectDate,
            child: Text('Select Date'),
          ),
          Expanded(
            child: Consumer<WorkoutService>(
              builder: (context, workoutService, child) {
                final workouts =
                    workoutService.getWorkoutsByDate(_selectedDate);
                return ListView.builder(
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    final workout = workouts[index];
                    return ListTile(
                      title: Text(workout.name),
                      subtitle: Text('Value: ${workout.value}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
