import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String? description;
  final DateTime start;
  final DateTime end;

  const CustomCard({
    super.key,
    required this.title,
    this.description,
    required this.start,
    required this.end,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (widget.description != null)
              Row(
                children: [
                  const Icon(Icons.description, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    widget.description!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            if (widget.start != null) const SizedBox(height: 8),
            if (widget.start != null)
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text('Início: ${DateFormat('HH:mm').format(widget.start!)}'),
                ],
              ),
            if (widget.end != null) const SizedBox(height: 4),
            if (widget.end != null)
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text('Fim: ${DateFormat('HH:mm').format(widget.end!)}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
