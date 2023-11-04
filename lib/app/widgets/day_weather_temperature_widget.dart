import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';

import '../models/informacoes_tempo_result.dart';

class DayWeatherTemperatureWidget extends StatelessWidget
    with InformacoesTempoHelper {
  final MapEntry<DiasSemanaEnum, Dia> dia;

  const DayWeatherTemperatureWidget({
    super.key,
    required this.theme,
    required this.dia,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dia.key.nome,
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            getImagePath(dia.value.periodos.values.toList()[1].tempo),
            height: 40,
            width: 55,
          ),
          Text(
            dia.value.periodos.values.toList()[1].tempo,
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${dia.value.periodos.values.toList()[1].graus}º',
            style: theme.appBarTheme.titleTextStyle?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
