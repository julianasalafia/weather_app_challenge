import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/services/http/i_http_service.dart';

import '../app/models/informacoes_tempo_result.dart';
import '../app/models/tempo_result.dart';

class TempoStore with ChangeNotifier {
  final IHttpService service;
  InformacoesTempoResult? informacoesTempoResult;
  TempoResult? tempoResult;

  TempoStore({required this.service});

  Future<void> loadInformacaoTempoResult() async {
    final result = await service.post(url: 'informacoes_do_tempo');
    informacoesTempoResult = InformacoesTempoResult.fromJson(result.data);

    notifyListeners();
  }

  Future<void> loadTempoResult() async {
    final result = await service.post(url: 'tempo');
    tempoResult = TempoResult.fromJson(result.data);

    notifyListeners();
  }
}
