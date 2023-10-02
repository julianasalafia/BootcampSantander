import 'package:flutter/material.dart';
import 'package:via_cep/pages/main_page.dart';

import '../shared/app_colors.dart';

class EnderecosCadastradosPage extends StatefulWidget {
  const EnderecosCadastradosPage({super.key});

  @override
  State<EnderecosCadastradosPage> createState() =>
      _EnderecosCadastradosPageState();
}

class _EnderecosCadastradosPageState extends State<EnderecosCadastradosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços cadastrados'),
        backgroundColor: AppColors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(
              children: [
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/correios-busca.png',
                          height: 60,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('12345-678',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text('centro',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
