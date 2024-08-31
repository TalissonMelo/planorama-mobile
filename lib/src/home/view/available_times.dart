import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/home/controller/free_time_schedule_controller.dart';
import 'package:liberbox_mobile/src/home/domain/available_time.dart';

class AvailableTimes extends StatefulWidget {
  const AvailableTimes({super.key});

  @override
  State<AvailableTimes> createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTimes> {
  int _selectedDuration = 30;

  final List<Map<String, dynamic>> _selectedDurations = [
    {'value': 30, 'label': '30 minutos'},
    {'value': 60, 'label': '1 hora'},
    {'value': 90, 'label': '1h 30m'},
    {'value': 120, 'label': '2 horas'},
  ];

  final freeTimeScheduleController = FreeTimeScheduleController();
  List<AvailableTime> schedules = [];

  @override
  void initState() {
    super.initState();
    fetchFreeTimeSchedules();
  }

  void fetchFreeTimeSchedules() async {
    List<AvailableTime> availableTimes =
        await freeTimeScheduleController.list(minutes: _selectedDuration);
    setState(() {
      schedules = availableTimes;
    });
  }

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
                  child: Text(
                    duration['label'],
                  ),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                  fetchFreeTimeSchedules();
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
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: schedule.times.length,
                      itemBuilder: (context, timeIndex) {
                        final time = schedule.times[timeIndex];
                        return CustomCard(
                          title: schedule.title,
                          start: time.startTime,
                          end: time.endTime,
                          isTime: true,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
