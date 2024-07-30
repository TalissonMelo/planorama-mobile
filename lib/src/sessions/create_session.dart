import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateSession extends StatefulWidget {
  const CreateSession({super.key});

  @override
  State<CreateSession> createState() => _CreateSessionState();
}

class _CreateSessionState extends State<CreateSession> {
  final timeFormatter =
      MaskTextInputFormatter(mask: '##:##', filter: {'#': RegExp(r'[0-9]')});

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  IconDataItem? _selectedIconDataItem;
  List<IconDataItem> _iconDataItems = [
    IconDataItem('Geografia', Colors.green),
    IconDataItem('Português', Colors.blue),
    IconDataItem('Opção 3', Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Cadastrar Agenda',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Agendamento',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const CustomTextField(
              icon: Icons.title_outlined,
              label: 'Título',
            ),
            const CustomTextField(
              icon: Icons.description,
              label: 'descrição',
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<IconDataItem>(
              decoration: InputDecoration(
                labelText: 'Legenda',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                suffixIcon: CircleAvatar(
                  backgroundColor: _selectedIconDataItem?.color ?? Colors.red,
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              ),
              items: _iconDataItems.map((IconDataItem value) {
                return DropdownMenuItem<IconDataItem>(
                  value: value,
                  child: Text(value.description),
                );
              }).toList(),
              onChanged: (IconDataItem? newValue) {
                setState(() {
                  _selectedIconDataItem = newValue;
                });
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: startTimeController,
              decoration: const InputDecoration(
                labelText: 'Horário Inicial',
                icon: Icon(Icons.access_time),
              ),
              keyboardType: TextInputType.datetime,
              inputFormatters: [timeFormatter],
            ),
            const SizedBox(height: 8),
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
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconDataItem {
  final String description;
  final Color color;

  IconDataItem(this.description, this.color);
}
