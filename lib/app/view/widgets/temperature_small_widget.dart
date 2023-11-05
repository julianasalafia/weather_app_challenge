import 'package:flutter/material.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_result.dart';
import '../utils/app_colors.dart';

class TemperatureSmallWidget extends StatelessWidget
    with InformacoesTempoHelper {
  final ThemeData theme;
  final MapEntry<PeriodosEnum, Periodo> periodo;
  final VoidCallback onTap;

  const TemperatureSmallWidget({
    super.key,
    required this.theme,
    required this.periodo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
              height: 145,
              width: 109,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    periodo.key.nome,
                    style: theme.appBarTheme.titleTextStyle
                        ?.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    getImagePath(periodo.value.tempo),
                    width: 75,
                    height: 45,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    '${periodo.value.graus}º',
                    style: theme.appBarTheme.titleTextStyle
                        ?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}