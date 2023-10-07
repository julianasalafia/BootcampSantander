import 'package:flutter_modular/flutter_modular.dart';
import 'package:via_cep/pages/main_page.dart';
import 'package:via_cep/repository/cep_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(CEPRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => MainPage(cepRepository: Modular.get()));
  }
}
