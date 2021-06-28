import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/reservations/models/reservation_model.dart';
import 'package:mi_house_reception/features/reservations/reservation_provider.dart';
import 'package:mi_house_reception/ui/screens/reservations/reservation_form.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(title: const Text('Reserva')),
      floatingActionButton: reservationsProv.isLoading
          ? null
          : FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed(ReservationFormScreen.route),
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
                : reservationsProv.failure != null
                    ? ErrorWidget(reservationsProv: reservationsProv)
                    : const ReservationsList(),
          ),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.reservationsProv}) : super(key: key);

  final ReservationProvider reservationsProv;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          reservationsProv.failure?.message ?? 'Ha ocurrido un error',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ReservationsList extends StatelessWidget {
  const ReservationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reservationsProv = Provider.of<ReservationProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      itemCount: reservationsProv.reservations.length,
      itemBuilder: (context, i) {
        final res = reservationsProv.reservations[i];
        return Card(
          child: ListTile(
            title: Text(res.nombreEspacio),
            subtitle: Text(res.tipoEspacio),
            onTap: () {},
            trailing:
                res.email == authProvider.auth!.username ? const Icon(Icons.chevron_right) : null,
          ),
        );
      },
    );
  }
}
