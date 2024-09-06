import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:personalworkout/services/WorkoutService.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Chart')),
      body: Consumer<WorkoutService>(
        builder: (context, workoutService, child) {
          final data = workoutService.getAllWorkouts();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                barGroups: data.map((workout) {
                  return BarChartGroupData(
                    x: workout.id,
                    barRods: [
                      BarChartRodData(
                        toY: workout.value.toDouble(),
                        color: Colors.blue,
                        width: 16,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
