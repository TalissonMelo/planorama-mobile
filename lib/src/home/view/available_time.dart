import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';

class AvailableTime extends StatefulWidget {
  const AvailableTime({super.key});

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  int _selectedDuration = 30;

  final List<Map<String, dynamic>> _selectedDurations = [
    {'value': 30, 'label': '30 minutos'},
    {'value': 60, 'label': '1 hora'},
    {'value': 90, 'label': '1h 30m'},
    {'value': 120, 'label': '2 horas'},
  ];

  @override
  void initState() {
    super.initState();
  }

  final List<Map<String, dynamic>> schedules = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                labelText: 'Período disponível',
                labelStyle: const TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              value: _selectedDuration,
              items: _selectedDurations.map((Map<String, dynamic> duration) {
                return DropdownMenuItem<int>(
                  value: duration['value'],
                  child: Text(duration['label']),
                );
              }).toList(),
              onChanged: (int? newValue) {
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
