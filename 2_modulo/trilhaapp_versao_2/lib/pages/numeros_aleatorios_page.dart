import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage_service.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeCliques = await storage.getQuantidadeCliques();
    setState(() {});

    print(numeroGerado);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gerador de números aleatórios'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum número gerado"
                    : numeroGerado.toString(),
                style: TextStyle(fontSize: 25),
              ),
              Text(
                quantidadeCliques == null
                    ? "Nenhum clique efetuado"
                    : quantidadeCliques.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            await storage.setNumeroAleatorio(numeroGerado!);
            await storage.setQuantidadeCliques(quantidadeCliques!);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
