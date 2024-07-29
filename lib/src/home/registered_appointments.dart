import 'package:flutter/material.dart';

class RegisteredAppointments extends StatelessWidget {
  const RegisteredAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> schedules = [
      {'name': 'Escola Estadual 1º I ', 'start': '07:30', 'end': '08:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '08:30', 'end': '09:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '10:00', 'end': '11:00'},
      {'name': 'Escola Estadual 1º I ', 'start': '07:30', 'end': '08:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '08:30', 'end': '09:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '10:00', 'end': '11:00'},
      {'name': 'Escola Estadual 1º I ', 'start': '07:30', 'end': '08:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '08:30', 'end': '09:30'},
      {'name': 'Escola Estadual 1º I ', 'start': '10:00', 'end': '11:00'},
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
                      const Icon(Icons.label, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        schedule['name']!,
                        style: const TextStyle(fontSize: 16),
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
