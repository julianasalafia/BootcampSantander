import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: Text('Usuário 2'),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Olá, tudo bem? \nPode falar?'),
              Text('08:59'),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: 'opcao1', child: Text('opção 1')),
                PopupMenuItem<String>(value: 'opcao2', child: Text('opção 2')),
                PopupMenuItem<String>(value: 'opcao3', child: Text('opção 3')),
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
