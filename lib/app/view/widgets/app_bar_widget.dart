import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/controller/weather_controller/weather_controller.dart';
import 'package:weather_app_challenge/app/utils/app_colors.dart';

import '../../utils/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTapButton;
  final VoidCallback? onTapRefreshButton;
  final bool isRefreshing;
  final int index;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.onTapButton,
    required this.index,
    this.onTapRefreshButton,
    this.isRefreshing = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
        ),
        child: Consumer<WeatherController>(builder: (context, store, _) {
          return Column(
            children: [
              const SizedBox(height: kSizedBoxHeight),
              Stack(
                children: [
                  if (index == 2) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: isRefreshing
                          ? Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              child: const SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.lightPurple,
                                  ),
                                ),
                              ),
                            )
                          : IconButton(
                              icon: Image.asset(
                                reloadIconButton,
                                width: kIconSize,
                                height: kIconSize,
                              ),
                              onPressed: onTapRefreshButton,
                            ),
                    ),
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: theme.appBarTheme.titleTextStyle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Image.asset(
                          menuIconButton,
                          width: kIconSize,
                          height: kIconSize,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                  if (index != 2) ...[
                    IconButton(
                      icon: Image.asset(
                        backIconButton,
                        width: kIconSize,
                        height: kIconSize,
                      ),
                      onPressed: onTapButton,
                    ),
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: theme.appBarTheme.titleTextStyle,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}
