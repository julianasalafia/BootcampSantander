import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_horizontal_page.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefa_hive_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TarefaHivePage(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: [
                BottomNavigationBarItem(label: 'Pag1', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Pag2', icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: 'Pag3', icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: 'Pag4', icon: Icon(Icons.list)),
                BottomNavigationBarItem(label: 'Pag4', icon: Icon(Icons.task)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
