import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/sessions/session.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final List<Map<String, String>> schedules = [
    {'name': 'Escola Estadual 1º I ', 'start': '07:30', 'end': '12:30'},
    {'name': 'Escola Estadual 1º II ', 'start': '07:30', 'end': '12:30'},
    {'name': 'Escola Estadual 2º I ', 'start': '07:30', 'end': '12:30'},
    {'name': 'Escola Estadual 2º II ', 'start': '07:30', 'end': '12:30'},
    {'name': 'Escola Estadual 3º II ', 'start': '07:30', 'end': '12:30'},
    {'name': 'Escola Estadual - Logística', 'start': '19:00', 'end': '22:30'},
    {'name': 'Escola Estadual - Informática', 'start': '19:00', 'end': '22:30'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
          return ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (c) {
                  return const Session();
                }),
              );
            },
            child: Card(
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
            ),
          );
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
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
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
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
