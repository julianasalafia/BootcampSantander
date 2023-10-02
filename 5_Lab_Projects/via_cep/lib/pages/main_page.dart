import 'package:flutter/material.dart';
import 'package:via_cep/pages/cadastro_cep_page.dart';
import 'package:via_cep/pages/enderecos_cadastrados.dart';
import 'package:via_cep/pages/home_page.dart';
import 'package:via_cep/shared/app_colors.dart';
import 'package:via_cep/shared/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pagePosition = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pagePosition = value;
                  });
                },
                children: const [
                  HomePage(),
                  CadastroCepPage(),
                  EnderecosCadastradosPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              selectedItemColor: AppColors.blue,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Cadastrar', icon: Icon(Icons.app_registration)),
                BottomNavigationBarItem(
                    label: 'Cadastrados', icon: Icon(Icons.apps)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
