import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';

class AvailableTime extends StatefulWidget {
  const AvailableTime({super.key});

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  String _selectedDuration = '30 minutos';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Período disponível ',
                labelStyle: const TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              value: _selectedDuration,
              items: <String>[
                '30 minutos',
                '1 hora',
                '1 hora e 30 minutos',
                '2 horas'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                });
              },
              style: const TextStyle(color: Colors.black),
              dropdownColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return CustomCard(
                  title: schedule['name']!,
                  start: schedule['start'],
                  end: schedule['end'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
