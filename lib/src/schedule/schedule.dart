import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/sessions/session.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final List<Map<String, dynamic>> schedules = [
    {
      'name': 'Escola Estadual 1º I ',
      'start': DateTime.now(),
      'end': DateTime.now().add(const Duration(hours: 1)),
    },
    {
      'name': 'Escola Estadual 1º I ',
      'start': DateTime.now(),
      'end': DateTime.now().add(const Duration(hours: 1)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Agendas', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              addSchedule(context);
            },
            icon: const Icon(Icons.add_circle),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Session(),
                  ),
                );
              },
              child: CustomCard(
                  title: schedule['name']!,
                  start: schedule['start']!,
                  end: schedule['end']!));
        },
      ),
    );
  }

  Future<bool?> addSchedule(BuildContext context) {
    final timeFormatter =
        MaskTextInputFormatter(mask: '##:##', filter: {'#': RegExp(r'[0-9]')});

    final TextEditingController startTimeController = TextEditingController();
    final TextEditingController endTimeController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Cadastrar Agenda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const CustomTextField(
                      icon: Icons.description,
                      label: 'Nome',
                    ),
                    TextFormField(
                      controller: startTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Horário Inicial',
                        icon: Icon(Icons.access_time),
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [timeFormatter],
                    ),
                    TextFormField(
                      controller: endTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Horário Final',
                        icon: Icon(Icons.access_time),
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [timeFormatter],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Cadastrar',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
