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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu app',
          style: GoogleFonts.cabin(),
        ),
      ),
      body: Center(
          child: Text(
        numeroGerado.toString(),
        style: const TextStyle(fontSize: 50),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cached),
        onPressed: () {
          setState(() {
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
