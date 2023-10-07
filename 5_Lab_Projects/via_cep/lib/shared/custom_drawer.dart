import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onSelectedPage;
  const CustomDrawer({super.key, required this.onSelectedPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 25),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Image.asset('assets/correios-simple-logo.png')),
          const SizedBox(height: 25),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text('Home'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              onSelectedPage(0);
            },
          ),
          InkWell(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Cadastrar CEP'),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onSelectedPage(1);
              }),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.map,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text('Endereços Cadastrados'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              onSelectedPage(2);
            },
          ),
        ],
      ),
    );
  }
}
