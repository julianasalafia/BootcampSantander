import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep/Model/cep_model.dart';
import 'package:via_cep/pages/cadastro_cep_page.dart';
import 'package:via_cep/pages/enderecos_cadastrados.dart';
import 'package:via_cep/pages/home_page.dart';
import 'package:via_cep/shared/app_colors.dart';
import 'package:via_cep/shared/custom_drawer.dart';
import 'package:via_cep/store/enderecos_cadastrados_store.dart';
import '../repository/cep_repository.dart';
import '../utils/constants.dart';

class MainPage extends StatefulWidget {
  final CEPRepository cepRepository;
  final EnderecosCadastradosStore enderecosCadastradosStore;
  const MainPage(
      {super.key,
      required this.cepRepository,
      required this.enderecosCadastradosStore});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;

  void onSelectPage(int pageIndex) {
    controller.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 600), curve: Curves.decelerate);
  }

  Future<void> onCepEdit(Cep cep) async {
    await Modular.to.pushNamed(editPage, arguments: cep);

    onSelectPage(0);
  }

  @override
  void initState() {
    super.initState();
    widget.enderecosCadastradosStore.getCeps();

    controller.addListener(_enderecosCadastroListener);
  }

  void _enderecosCadastroListener() {
    setState(() {
      page = controller.page?.toInt() ?? 0;
      widget.enderecosCadastradosStore.getCeps();
    });
  }

  String setAppBarTitle(int page) {
    late String appBarTitle;

    switch (page) {
      case 0:
        appBarTitle = mainPageTitle;
        break;
      case 1:
        appBarTitle = registerCepTitle;
        break;
      case 2:
        appBarTitle = registeredCepsTitle;
        break;
      default:
        '';
    }
    return appBarTitle;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(setAppBarTitle(page)),
          backgroundColor: AppColors.blue,
        ),
        drawer: CustomDrawer(onSelectedPage: onSelectPage),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  HomePage(
                    cepRepository: widget.cepRepository,
                    onPageChanged: () => onSelectPage(1),
                  ),
                  CadastroCepPage(cepRepository: widget.cepRepository),
                  EnderecosCadastradosPage(
                    enderecosCadastradosStore: widget.enderecosCadastradosStore,
                    cepRepository: widget.cepRepository,
                    onCepEdit: onCepEdit,
                  ),
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
                BottomNavigationBarItem(label: home, icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: register, icon: Icon(Icons.app_registration)),
                BottomNavigationBarItem(
                    label: registered, icon: Icon(Icons.apps)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
