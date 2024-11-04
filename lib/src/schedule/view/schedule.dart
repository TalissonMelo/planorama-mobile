import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/schedule/controller/create_schedule_controller.dart';
import 'package:liberbox_mobile/src/schedule/controller/schedule_controller.dart';
import 'package:liberbox_mobile/src/schedule/domain/schedule_response.dart';
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
  List<ScheduleResponse> filteredSchedules = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    listSchedules();
  }

  void listSchedules() async {
    List<ScheduleResponse> scheduleResponses = await scheduleController.list();
    setState(() {
      schedules = List.from(scheduleResponses);
      filteredSchedules = List.from(scheduleResponses);
    });
  }

  void applyFilter() {
    setState(() {
      filteredSchedules = schedules
          .where((schedule) =>
              schedule.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text(
            'agenda'.tr,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await addSchedule(context);
                setState(() {});
              },
              icon: const Icon(Icons.add_circle),
              color: Colors.white,
            ),
          ]),
      body: scheduleController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      searchQuery = value;
                      applyFilter();
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        isDense: true,
                        hintText: 'pesquise_aqui'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700, fontSize: 14),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 21,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: filteredSchedules.length,
                    itemBuilder: (context, index) {
                      final schedule = filteredSchedules[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(PagesRoutes.sessionsRoute,
                              parameters: {'scheduleId': schedule.id});
                        },
                        child: CustomCard(
                          title: schedule.name,
                          start: schedule.startTime,
                          end: schedule.endTime,
                          isTime: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
    //   },
    // );
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formSchedule,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'adicionar_agenda'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CustomTextField(
                      icon: Icons.description,
                      label: 'nome'.tr,
                      validator: descriptionValidator,
                      controller: nameController,
                      keyboardType: TextInputType.text),
                  TextFormField(
                    controller: startTimeController,
                    validator: timeValidator,
                    decoration: InputDecoration(
                      labelText: 'horario_inicial'.tr,
                      icon: const Icon(Icons.access_time),
                    ),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [timeFormatter],
                  ),
                  TextFormField(
                    controller: endTimeController,
                    validator: timeValidator,
                    decoration: InputDecoration(
                      labelText: 'horario_final'.tr,
                      icon: const Icon(Icons.access_time),
                    ),
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [timeFormatter],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
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
                          : () async {
                              FocusScope.of(context).unfocus();
                              if (formSchedule.currentState!.validate()) {
                                ScheduleResponse? response =
                                    await createScheduleController.created(
                                  name: nameController.text,
                                  endTime: endTimeController.text,
                                  startTime: startTimeController.text,
                                );

                                if (response != null) {
                                  schedules.insert(0, response);
                                }

                                if (!context.mounted) return;

                                Navigator.pop(context);
                              }
                            },
                      child: Text(
                        'confirmar'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
