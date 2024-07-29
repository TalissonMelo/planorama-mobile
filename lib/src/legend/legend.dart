import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';

class Legend extends StatefulWidget {
  const Legend({super.key});

  @override
  State<Legend> createState() => _LegendState();
}

class _LegendState extends State<Legend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Legendas', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              addLegend();
            },
            icon: const Icon(Icons.add_circle),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 20, 5, 0),
        children: const [
          Card(
            child: ListTile(
                leading: Icon(Icons.label, color: Color(0xFF000000), size: 50),
                title: Text(
                  'Inglês',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.label, color: Colors.purple, size: 50),
                title: Text(
                  'português',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.label, color: Colors.green, size: 50),
                title: Text(
                  'Geografia',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.label, color: Colors.grey, size: 50),
                title: Text(
                  'Historia',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
        ],
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
                const CustomTextField(
                  icon: Icons.description,
                  label: 'Descrição',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      const Text(
                        'Selecione uma cor',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 100,
                        child: BlockPicker(
                          pickerColor: selectedColor,
                          onColorChanged: (color) {
                            selectedColor = color;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
        );
      },
    );
  }
}
