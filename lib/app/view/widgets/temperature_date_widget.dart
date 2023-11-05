import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';
import 'package:weather_app_challenge/app/utils/extensions/date_time_extension.dart';

import '../../models/informacoes_tempo_result.dart';

class TemperatureDateWidget extends StatelessWidget
    with InformacoesTempoHelper {
  final ThemeData theme;
  final MapEntry<DiasSemanaEnum, Dia> dia;

  const TemperatureDateWidget({
    super.key,
    required this.theme,
    required this.dia,
  });

  @override
  Widget build(BuildContext context) {
    final periodo = dia.value.getPeriodoNow();
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          dia.key.nome,
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: Image.asset(
            getImagePath(periodo.value.tempo),
            fit: BoxFit.contain,
          ),
        ),
        Text(
          '${periodo.value.graus}º',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 81,
          ),
        ),
        Text(
          DateTime.now().toPTBR(),
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
            height: 0.1,
          ),
        ),
      ],
    );
  }
}
