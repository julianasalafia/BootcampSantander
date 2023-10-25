import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep/pages/cadastro_cep_page.dart';
import 'package:via_cep/pages/cep_info_page.dart';
import 'package:via_cep/pages/enderecos_cadastrados.dart';
import 'package:via_cep/pages/main_page.dart';
import 'package:via_cep/repository/cep_repository.dart';
import 'package:via_cep/store/enderecos_cadastrados_store.dart';
import 'package:via_cep/utils/constants.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(CEPRepository.new);
    i.addSingleton(EnderecosCadastradosStore.new);
  }

  @override
  void routes(r) {
    r.child(homePage,
        child: (context) => MainPage(
              cepRepository: Modular.get(),
              enderecosCadastradosStore: Modular.get(),
            ));
    r.child(editPage,
        child: (context) => CadastroCepPage(
              cepRepository: Modular.get(),
              cep: r.args.data,
            ));
    r.child(cepInfoPage,
        child: (context) => CepInfoPage(
              cep: r.args.data,
            ));
    r.child(enderecosCadastradosPage,
        child: (context) => EnderecosCadastradosPage(
              enderecosCadastradosStore: Modular.get(),
              cepRepository: Modular.get(),
              onCepEdit: r.args.data,
            ));
  }
}
