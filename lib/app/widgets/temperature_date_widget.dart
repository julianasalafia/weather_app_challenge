import 'package:flutter/material.dart';

class TemperatureDateWidget extends StatelessWidget {
  const TemperatureDateWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Segunda',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        Image.asset('assets/images/cloudy.png'),
        Text(
          '23º',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 81,
          ),
        ),
        Text(
          '26 de Maio de 2023',
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            fontSize: 12,
            height: 0.1,
          ),
        ),
      ],
    );
  }
}
