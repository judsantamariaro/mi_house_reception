import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/reservations/models/reservation_model.dart';
import 'package:mi_house_reception/features/reservations/reservation_provider.dart';
import 'package:mi_house_reception/ui/screens/moving/moving_form.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class MovingCalendarScreen extends StatefulWidget {
  const MovingCalendarScreen({Key? key}) : super(key: key);

  static const route = 'MovingCalendarScreen';

  @override
  _MovingCalendarScreenState createState() => _MovingCalendarScreenState();
}

class _MovingCalendarScreenState extends State<MovingCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      Provider.of<ReservationProvider>(context, listen: false).fetchReservations(
        ReservationModel(
          fechaInicial: ReservationUtils.getFormattedDate(DateTime.now()),
          nombreConjunto: Provider.of<AuthProvider>(context, listen: false).auth!.conjunto,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final reservationsProv = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Mudanzas')),
      floatingActionButton: reservationsProv.isLoading
          ? null
          : FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed(MovingFormScreen.route),
              child: const Icon(Icons.add),
            ),
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
              reservationsProv.onSelectedDateChanged(_selectedDay);
              reservationsProv.fetchReservations(
                ReservationModel(
                  fechaInicial: ReservationUtils.getFormattedDate(selectedDay),
                  nombreConjunto: Provider.of<AuthProvider>(context, listen: false).auth!.conjunto,
                ),
              );
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
          const SizedBox(height: 20),
          Expanded(
            child: reservationsProv.isLoading
                ? const Center(child: CircularProgressIndicator())
                : reservationsProv.getReservations(context).isEmpty
                    ? const ErrorWidget()
                    : const MovingList(),
          ),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'No has programado mudanzas para este dia',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MovingList extends StatelessWidget {
  const MovingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resProv = Provider.of<ReservationProvider>(context);
    final spaces = resProv.getReservations(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      itemCount: spaces.length,
      itemBuilder: (context, i) {
        final res = spaces[i];
        return Dismissible(
          key: Key('${res.id}${res.fechaInicio}'),
          direction: DismissDirection.endToStart,
          onDismissed: (dismissed) => resProv.deleteMoving(res),
          background: Card(
            color: Colors.red,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
          ),
          child: Card(
            child: ListTile(
              title: Text(res.nombreEspacio),
              subtitle: Text(res.tipoEspacio),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => resProv.deleteMoving(res),
              ),
            ),
          ),
        );
      },
    );
  }
}
