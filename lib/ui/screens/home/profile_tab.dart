import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _ProfileCard(),
          Expanded(
            child: ListView.separated(
              itemCount: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text('No se que poner #$index'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context).auth!;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wallpaper2.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            width: size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset('assets/icons/watchman.png'),
          ),
          const SizedBox(height: 10),
          Text(
            '${auth.nombres} ${auth.apellidos}',
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
