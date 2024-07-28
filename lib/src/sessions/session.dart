import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:liberbox_mobile/src/initial/base.dart';
import 'package:liberbox_mobile/src/sessions/model/legend_color.dart';
import 'package:liberbox_mobile/src/sessions/model/session_response.dart';
import 'package:table_calendar/table_calendar.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<SessionResponse> _events = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _events = [
      SessionResponse(
          id: '1',
          scheduleId: '1',
          color: LegendColor(primary: '#000', secondary: 'azul claro'),
          title: 'Reunião',
          start: DateTime.utc(2024, 7, 25, 10, 0),
          end: DateTime.utc(2024, 7, 25, 11, 0),
          description: 'Reunião importante'),
      SessionResponse(
          id: '2',
          scheduleId: '2',
          color: LegendColor(primary: '#000', secondary: 'verde claro'),
          title: 'Consulta',
          start: DateTime.utc(2024, 7, 28, 14, 0),
          end: DateTime.utc(2024, 7, 28, 15, 0),
          description: 'Consulta médica'),
      SessionResponse(
          id: '3',
          scheduleId: '3',
          color: LegendColor(primary: '#000', secondary: 'vermelho claro'),
          title: 'Almoço com amigos',
          start: DateTime.utc(2024, 7, 27, 12, 0),
          end: DateTime.utc(2024, 7, 27, 13, 30),
          description: 'Almoço no restaurante'),
      SessionResponse(
          id: '4',
          scheduleId: '4',
          color: LegendColor(primary: '#000', secondary: 'amarelo claro'),
          title: 'Projeto final',
          start: DateTime.utc(2024, 7, 27, 16, 0),
          end: DateTime.utc(2024, 7, 27, 18, 0),
          description: 'Trabalho no projeto final')
    ];
  }

  List<SessionResponse> _getEventsForDay(DateTime day) {
    return _events
        .where((event) =>
            event.start.year == day.year &&
            event.start.month == day.month &&
            event.start.day == day.day)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
                child: TableCalendar(
                  locale: 'pt_BR',
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  eventLoader: _getEventsForDay,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.blue.shade800,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.blue.shade600),
                    weekendStyle: TextStyle(color: Colors.red.shade600),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return const Base();
                            }),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                      ),
                      const SizedBox(
                          width: 5), // Espaço entre o ícone e o texto
                      const Text(
                        'Agendamentos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_selectedDay != null &&
                  _getEventsForDay(_selectedDay!).isNotEmpty)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: _getEventsForDay(_selectedDay!).map((event) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.event,
                                        color: Colors.black),
                                    const SizedBox(width: 8),
                                    Text(
                                      event.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time,
                                        color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Text(
                                        'Início: ${event.start.hour}:${event.start.minute.toString().padLeft(2, '0')} - Fim: ${event.end.hour}:${event.end.minute.toString().padLeft(2, '0')}'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.description,
                                        color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Text(event.description),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
