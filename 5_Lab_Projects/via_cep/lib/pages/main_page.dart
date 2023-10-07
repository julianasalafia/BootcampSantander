import 'package:flutter/material.dart';
import 'package:via_cep/pages/cadastro_cep_page.dart';
import 'package:via_cep/pages/enderecos_cadastrados.dart';
import 'package:via_cep/pages/home_page.dart';
import 'package:via_cep/shared/app_colors.dart';
import 'package:via_cep/shared/custom_drawer.dart';
import '../repository/cep_repository.dart';

class MainPage extends StatefulWidget {
  final CEPRepository cepRepository;
  const MainPage({super.key, required this.cepRepository});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;

  void onSelectedPage(int pageIndex) {
    controller.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 600), curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        page = controller.page?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(onSelectedPage: onSelectedPage),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  HomePage(
                    cepRepository: widget.cepRepository,
                    onPageChanged: () => onSelectedPage(1),
                  ),
                  CadastroCepPage(cepRepository: widget.cepRepository),
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
              currentIndex: page,
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
