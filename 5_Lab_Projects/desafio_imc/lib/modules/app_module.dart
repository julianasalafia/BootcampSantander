import 'package:desafio_imc/pages/home_page.dart';
import 'package:desafio_imc/pages/results_page.dart';
import 'package:desafio_imc/pages/single_person_result_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/constants.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      homePage,
      child: (context) => const HomePage(),
    );
    r.child(
      resultsPage,
      child: (context) => ResultsPage(
        persons: r.args.data,
      ),
    );
    r.child(
      singlePersonResultPage,
      child: (context) => SinglePersonResultPage(
        person: r.args.data,
      ),
    );
  }
}
