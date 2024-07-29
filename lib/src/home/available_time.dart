import 'package:flutter/material.dart';

class AvailableTime extends StatefulWidget {
  const AvailableTime({super.key});

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> schedules = [
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
      {'name': 'Escola Estadual', 'start': '11:00', 'end': '12:30'},
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.event, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        schedule['name']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('Início: ${schedule['start']!}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('Fim: ${schedule['end']!}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
