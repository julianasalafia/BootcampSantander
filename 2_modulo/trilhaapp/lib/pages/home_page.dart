import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/services/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu app',
          style: GoogleFonts.cabin(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ações do usuário',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'Foi clicado $quantidadeCliques vezes',
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              'O número gerado foi $numeroGerado',
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.red,
                  child: Text(
                    '10',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Text(
                    '20',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Text(
                    '30',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cached),
        onPressed: () {
          setState(() {
            quantidadeCliques++;
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
