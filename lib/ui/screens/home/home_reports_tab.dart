import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/ui/models/home_menu.dart';
import 'package:mi_house_reception/ui/screens/reservations/reservations_calendar.dart';
import 'package:mi_house_reception/ui/widgets/appbar/custom_appbar.dart';
import 'package:mi_house_reception/ui/widgets/cards/image_card.dart';

class ReservationsTab extends StatelessWidget {
  const ReservationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cards = [
      HomeMenu(
        text: 'Salones comunales',
        imgPath: 'assets/image_cards/2.jpg',
        onTap: () => Navigator.of(context).pushNamed(ReservationsCalendar.route),
      ),
      HomeMenu(text: 'Espacios compartidos', imgPath: 'assets/image_cards/3.jpg', onTap: () {}),
      HomeMenu(text: 'Mudanzas', imgPath: 'assets/image_cards/4.jpg', onTap: () {}),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              FadeInDown(
                child: const CustomAppBar(),
              ),
              const SizedBox(height: 10),
              const Text(
                'Selecciona la categoria en la que deseas hacer la reserva',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, i) => FadeInLeft(
                    delay: Duration(milliseconds: 200 * i),
                    duration: const Duration(milliseconds: 400),
                    child: ImageCard(
                      text: cards[i].text,
                      onPressed: cards[i].onTap,
                      imgPath: cards[i].imgPath,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
