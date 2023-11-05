import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';

import '../../models/informacoes_tempo_result.dart';

class DayWeatherTemperatureWidget extends StatelessWidget
    with InformacoesTempoHelper {
  final MapEntry<DiasSemanaEnum, Dia> dia;
  final VoidCallback onTap;
  final ThemeData theme;

  const DayWeatherTemperatureWidget({
    super.key,
    required this.theme,
    required this.dia,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                dia.key.nome,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                getImagePath(dia.value.periodos.values.toList()[1].tempo),
                height: 40,
                width: 55,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                dia.value.periodos.values.toList()[1].tempo,
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${dia.value.periodos.values.toList()[1].graus}º',
                style: theme.appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
