import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationsCalendar extends StatefulWidget {
  const ReservationsCalendar({Key? key}) : super(key: key);

  static const route = 'ReservationsCalendar';

  @override
  _ReservationsCalendarState createState() => _ReservationsCalendarState();
}

class _ReservationsCalendarState extends State<ReservationsCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reserva')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 90)),
            focusedDay: _focusedDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                _selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
            onPageChanged: (focusedDay) => _focusedDay = focusedDay,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  title: Text('Event #$i'),
                  subtitle: Text('Event description #$i'),
                  onTap: () {},
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
