import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/schedule/controller/create_schedule_controller.dart';
import 'package:liberbox_mobile/src/schedule/controller/schedule_controller.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
import 'package:liberbox_mobile/src/sessions/session.dart';
import 'package:liberbox_mobile/src/util/validator_description.dart';
import 'package:liberbox_mobile/src/util/validator_time.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final scheduleController = ScheduleController();
  List<ScheduleResponse> schedules = [];

  @override
  void initState() {
    super.initState();
    listSchedules();
  }

  void listSchedules() async {
    List<ScheduleResponse> scheduleResponses = await scheduleController.list();
    setState(() {
      schedules = scheduleResponses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                      title: schedule.name,
                      start: schedule.startTime,
                      end: schedule.endTime),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> addSchedule(BuildContext context) {
    final timeFormatter =
        MaskTextInputFormatter(mask: '##:##', filter: {'#': RegExp(r'[0-9]')});

    final createScheduleController = CreateScheduleController();
    final formSchedule = GlobalKey<FormState>();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();
    final nameController = TextEditingController();

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
                child: Form(
                  key: formSchedule,
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
                      CustomTextField(
                          icon: Icons.description,
                          label: 'Nome',
                          validator: descriptionValidator,
                          controller: nameController,
                          keyboardType: TextInputType.text),
                      TextFormField(
                        controller: startTimeController,
                        validator: timeValidator,
                        decoration: const InputDecoration(
                          labelText: 'Horário Inicial',
                          icon: Icon(Icons.access_time),
                        ),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [timeFormatter],
                      ),
                      TextFormField(
                        controller: endTimeController,
                        validator: timeValidator,
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
                          onPressed: createScheduleController.isLoading.value
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  if (formSchedule.currentState!.validate()) {
                                    createScheduleController.created(
                                      name: nameController.text,
                                      endTime: endTimeController.text,
                                      startTime: startTimeController.text,
                                    );

                                    Navigator.pop(context);
                                  }
                                },
                          child: const Text('Cadastrar',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
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
