import 'package:flutter/material.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:trilhaapp/repositories/marvel/marvel_api_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late MarvelApiRepository marvelApiRepository;
  CharactersModel charactersModel = CharactersModel();
  int offset = 0;
  var carregando = false;

  @override
  void initState() {
    marvelApiRepository = MarvelApiRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (charactersModel.data == null || charactersModel.data!.results == null) {
      charactersModel = await marvelApiRepository.getCharacters(offset);
    } else {
      setState(() {
        carregando = true;
      });
      offset = offset + charactersModel.data!.count!;
      var tempList = await marvelApiRepository.getCharacters(offset);
      charactersModel.data!.results!.addAll(tempList.data!.results!);
      carregando = false;
    }
    setState(() {});
  }

  int retornaQuantidadeTotal() {
    try {
      return charactersModel.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int retornaQuantidadeAtual() {
    try {
      return offset + charactersModel.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
            'Heróis: ${retornaQuantidadeAtual()}/${retornaQuantidadeTotal()}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: charactersModel.data == null ||
                      charactersModel.data!.results == null
                  ? 0
                  : charactersModel.data!.results!.length,
              itemBuilder: (_, int index) {
                var character = charactersModel.data!.results![index];
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "${character.thumbnail!.path!}.${character.thumbnail!.extension!}",
                        width: 150,
                        height: 150,
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(character.description!),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          !carregando
              ? ElevatedButton(
                  onPressed: () {
                    carregarDados();
                  },
                  child: const Text('Carregar mais...'))
              : CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
