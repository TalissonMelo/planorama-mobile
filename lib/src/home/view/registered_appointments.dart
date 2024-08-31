import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/home/controller/busy_schedule_controller.dart';
import 'package:liberbox_mobile/src/home/domain/registered_appointment.dart';

class RegisteredAppointments extends StatefulWidget {
  const RegisteredAppointments({super.key});

  @override
  State<RegisteredAppointments> createState() => _RegisteredAppointmentsState();
}

class _RegisteredAppointmentsState extends State<RegisteredAppointments> {
  final busyScheduleController = BusyScheduleController();
  List<RegisteredAppointment> schedules = [];

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  void fetchSchedules() async {
    List<RegisteredAppointment> fetchedLegends =
        await busyScheduleController.list();
    setState(() {
      schedules = fetchedLegends;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: schedule.sessions.length,
                itemBuilder: (context, sessionIndex) {
                  final session = schedule.sessions[sessionIndex];
                  return CustomCard(
                    title: schedule.name,
                    description: session.title,
                    start: session.startTime,
                    end: session.endTime,
                    isTime: false,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
