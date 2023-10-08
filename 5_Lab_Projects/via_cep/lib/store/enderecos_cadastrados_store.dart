import 'package:flutter/cupertino.dart';
import '../Model/cep_model.dart';
import '../repository/cep_repository.dart';

class EnderecosCadastradosState {
  final List<Cep> ceps;
  final bool isLoading;

  EnderecosCadastradosState._({required this.ceps, required this.isLoading});

  factory EnderecosCadastradosState.initial() {
    return EnderecosCadastradosState._(ceps: [], isLoading: false);
  }

  EnderecosCadastradosState copyWith({List<Cep>? ceps, bool? isLoading}) {
    return EnderecosCadastradosState._(
        ceps: ceps ?? this.ceps, isLoading: isLoading ?? this.isLoading);
  }
}

class EnderecosCadastradosStore
    extends ValueNotifier<EnderecosCadastradosState> {
  final CEPRepository cepRepository;
  EnderecosCadastradosStore(this.cepRepository)
      : super(EnderecosCadastradosState.initial());

  Future<void> getCeps() async {
    value = value.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 5));

    final ceps = await cepRepository.getLista();
    value = value.copyWith(ceps: ceps, isLoading: false);
  }
}
