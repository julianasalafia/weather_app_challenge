import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_result.dart';

import '../utils/app_colors.dart';

class TemperatureSmallWidget extends StatelessWidget {
  final ThemeData theme;
  final Periodo periodo;

  const TemperatureSmallWidget({
    super.key,
    required this.theme,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
            height: 155,
            width: 115,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  //periodos
                  // falta construir essa tela se baseando nos dados de um Estado mesmo, mockar um estado pronto e fazer funcionar, e dps tratar a navegação
                  'Manhã',
                  style:
                      theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/cloudy.png',
                  width: 75,
                  height: 45,
                ),
                const SizedBox(height: 25),
                Text(
                  '23º',
                  style:
                      theme.appBarTheme.titleTextStyle?.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
