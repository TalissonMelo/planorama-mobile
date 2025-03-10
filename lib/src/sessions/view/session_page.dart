import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:liberbox_mobile/src/components/custom_card.dart';
import 'package:liberbox_mobile/src/legend/model/legend_response.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/sessions/controller/session_controller.dart';
import 'package:liberbox_mobile/src/sessions/model/session_response.dart';
import 'package:table_calendar/table_calendar.dart';

class SessionPage extends StatefulWidget {
  final String scheduleId;

  const SessionPage({super.key, required this.scheduleId});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final sessionController = SessionController();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late String scheduleId;
  List<SessionResponse> _events = [];

  List<LegendResponse> legends = [];

  @override
  void initState() {
    super.initState();
    scheduleId = widget.scheduleId;
    initializeDateFormatting();
    fetchSessions();
  }

  void fetchSessions() async {
    List<SessionResponse> fetchedSessions = await sessionController.list(
      scheduleId,
      _focusedDay.month,
      _focusedDay.year,
    );
    setState(() {
      _events = List.from(fetchedSessions);
    });
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            const Text('Agendamentos', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          if (legends.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: legends.map((legend) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: legend.colorValue,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            legend.description,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                markersMaxCount: 5,
                markerDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                markerSizeScale: 0.15,
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isEmpty) return const SizedBox();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: events
                        .map((event) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  (event as SessionResponse).color.colorValue,
                            ),
                          );
                        })
                        .take(5)
                        .toList(),
                  );
                },
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
                setState(() {
                  _focusedDay = focusedDay;
                });
                fetchSessions();
              },
            ),
          ),
          if (_selectedDay != null &&
              _getEventsForDay(_selectedDay!).isNotEmpty)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: _getEventsForDay(_selectedDay!).map((event) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(PagesRoutes.chatRoute, parameters: {
                          'sessionId': event.id,
                          'title': event.title
                        });
                      },
                      child: CustomCard(
                        title: event.title,
                        start: event.formatHour(event.start),
                        end: event.formatHour(event.end),
                        description: event.description,
                        isTime: true,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
