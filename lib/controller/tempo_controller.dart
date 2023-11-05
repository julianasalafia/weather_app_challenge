import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/services/http/i_http_service.dart';

import '../app/models/informacoes_tempo_result.dart';
import '../app/models/tempo_result.dart';

class TempoController with ChangeNotifier {
  final IHttpService service;
  InformacoesTempoResult? informacoesTempoResult;
  TempoResult? tempoResult;
  Estado? selectedState;
  MapEntry<DiasSemanaEnum, Dia>? selectedDay;
  bool isRefreshing = false;

  TempoController({required this.service});

  Future<void> loadInformacaoTempoResult() async {
    final result = await service.post(url: 'informacoes_do_tempo');
    informacoesTempoResult = InformacoesTempoResult.fromJson(result.data);
    if (selectedState == null && informacoesTempoResult != null) {
      selectedState = informacoesTempoResult?.estados.first;
      selectedDay = selectedState!.dias.entries.first;
    }

    notifyListeners();
  }

  Future<void> loadTempoResult() async {
    final result = await service.post(url: 'tempo');
    tempoResult = TempoResult.fromJson(result.data);

    notifyListeners();
  }

  void onSelectState(Estado state) {
    selectedState = state;
    notifyListeners();
  }

  void onSelectDay(MapEntry<DiasSemanaEnum, Dia> day) {
    selectedDay = day;
    notifyListeners();
  }

  Future<void> refresh() async {
    isRefreshing = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    loadInformacaoTempoResult();
    isRefreshing = false;
    notifyListeners();
  }
}
