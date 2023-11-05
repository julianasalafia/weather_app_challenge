import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_result.dart';

import '../utils/app_colors.dart';

class WeatherTemperatureWidget extends StatelessWidget
    with InformacoesTempoHelper {
  final Periodo periodo;
  final ThemeData theme;

  const WeatherTemperatureWidget({
    super.key,
    required this.theme,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 170,
        width: 387,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightPurple,
              AppColors.lightMidPurple,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 150, child: Image.asset(getImagePath(periodo.tempo))),
            Text(
              '${periodo.graus}º',
              style: theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 55),
            ),
          ],
        ),
      ),
    );
  }
}
