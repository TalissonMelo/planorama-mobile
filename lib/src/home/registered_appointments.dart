import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';

class RegisteredAppointments extends StatelessWidget {
  const RegisteredAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schedules = [
      {
        'name': 'Escola Estadual 1º I ',
        'start': DateTime.now(),
        'end': DateTime.now().add(Duration(hours: 1)),
      },
      {
        'name': 'Escola Estadual 1º I ',
        'start': DateTime.now(),
        'end': DateTime.now().add(Duration(hours: 1)),
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return CustomCard(
            title: schedule['name']!,
            description: schedule['name']!,
            start: schedule['start']!,
            end: schedule['end']!,
          );
        },
      ),
    );
  }
}
