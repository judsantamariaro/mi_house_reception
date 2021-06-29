import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/ui/models/home_menu.dart';
import 'package:mi_house_reception/ui/screens/moving/moving_calendar.dart';
import 'package:mi_house_reception/ui/widgets/appbar/custom_appbar.dart';
import 'package:mi_house_reception/ui/widgets/cards/image_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<HomeMenu> cards = [
      HomeMenu(text: 'Visitantes', imgPath: 'assets/image_cards/1.jpg', onTap: () {}),
      HomeMenu(text: 'Parqueaderos', imgPath: 'assets/image_cards/2.jpg', onTap: () {}),
      HomeMenu(
        text: 'Mudanzas',
        imgPath: 'assets/image_cards/3.jpg',
        onTap: () => Navigator.of(context).pushNamed(MovingCalendarScreen.route),
      ),
      HomeMenu(text: 'Crear una alerta', imgPath: 'assets/image_cards/4.jpg', onTap: () {}),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              FadeInDown(child: const CustomAppBar()),
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
