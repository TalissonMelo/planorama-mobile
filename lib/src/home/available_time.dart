import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';

class AvailableTime extends StatefulWidget {
  const AvailableTime({super.key});

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schedules = [
      {
        'name': 'Escola Isolina 2º I ',
        'start': DateTime.now(),
        'end': DateTime.now().add(const Duration(hours: 1)),
      },
      {
        'name': 'Escola Raul Soares 3º I ',
        'start': DateTime.now(),
        'end': DateTime.now().add(const Duration(hours: 1)),
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
              start: schedule['start'],
              end: schedule['end']);
        },
      ),
    );
  }
}
