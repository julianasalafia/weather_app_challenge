import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class InformationWidget extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String image;

  const InformationWidget({
    super.key,
    required this.theme,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.purplePureDark.withOpacity(0.23),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: theme.appBarTheme.titleTextStyle,
        ),
      ],
    );
  }
}
