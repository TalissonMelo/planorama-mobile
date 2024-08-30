import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/legend/controller/create_legend_controller.dart';
import 'package:liberbox_mobile/src/legend/controller/list_legend_controller.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';

import '../../util/validator_description.dart';

class Legend extends StatefulWidget {
  const Legend({super.key});

  @override
  State<Legend> createState() => _LegendState();
}

class _LegendState extends State<Legend> {
  final listLegendController = ListLegendController();
  final createLegendController = CreateLegendController();
  final formLegend = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final colorController = TextEditingController();

  List<LegendResponse> legends = [];

  @override
  void initState() {
    super.initState();
    fetchLegends();
  }

  void fetchLegends() async {
    List<LegendResponse> fetchedLegends = await listLegendController.list();
    setState(() {
      legends = List.from(fetchedLegends);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text('Legendas', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () async {
              await addLegend();
              setState(() {});
            },
            icon: const Icon(Icons.add_circle),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 20, 5, 0),
        itemCount: legends.length,
        itemBuilder: (context, index) {
          final legend = legends[index];
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.label,
                color: legend.colorValue,
                size: 50,
              ),
              title: Text(
                legend.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool?> addLegend() {
    return showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = Colors.blue;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formLegend,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Cadastrar legenda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomTextField(
                    icon: Icons.description,
                    label: 'Descrição',
                    validator: descriptionValidator,
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        children: [
                          const Text(
                            'Selecione uma cor',
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: BlockPicker(
                              pickerColor: selectedColor,
                              onColorChanged: (color) {
                                selectedColor = color;
                                colorController.text =
                                    '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      onPressed: createLegendController.isLoading.value
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              if (formLegend.currentState!.validate()) {
                                LegendResponse? response =
                                    await createLegendController.created(
                                        description: descriptionController.text,
                                        color: colorController.text);

                                if (response != null) {
                                  legends.insert(0, response);
                                  descriptionController.text = "";
                                }

                                if (!context.mounted) return;

                                Navigator.pop(context);
                              }
                            },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
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
