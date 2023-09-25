import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trilhaapp/pages/auto_size_text/auto_size_text_page.dart';
import 'package:trilhaapp/pages/battery/battery_page.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/percent_indicator/percent_indicator_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('camera'),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('galeria'),
                          leading: Icon(Icons.photo_album),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black54),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    'https://hermes.digitalinnovation.one/assets/diome/logo.png'),
              ),
              accountName: Text('Juliana Salafia'),
              accountEmail: Text('ju@gmail.com'),
            ),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.percent,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Indicador de porcentagem'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PercentIndicatorPage()));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Auto Size Text'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AutoSizeTextPage()));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.house,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('INTL'),
                  ],
                )),
            onTap: () async {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBR = NumberFormat('#,###.0#', 'pt_BR');
              print(f.format(12345.345));
              print(fBR.format(12345.345));

              var data = DateTime(2023, 23, 09);
              await initializeDateFormatting('en_US', null);
              print(DateFormat('EEEEE', 'en_US').format(data));

              await initializeDateFormatting('pt_BR', null);
              print(DateFormat('EEEEE', 'pt_BR').format(data));

              Intl.defaultLocale = 'pt_BR';
              print(data.toString());
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.batteryHalf,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Indicador da bateria'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BatteryPage()));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.chrome,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Abrir no Google'),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse('https://www.dio.me'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.chrome,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text('Abrir no Google Maps'),
                  ],
                )),
            onTap: () async {
              await launchUrl(
                  Uri.parse('google.navigation:q=Santos SP&mode=d'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 10),
                    Text('Sair'),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text(
                        'Meu app',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text('Você sairá do aplicativo!'),
                          Text('Deseja realmente sair?'),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Não')),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text('Sim')),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
