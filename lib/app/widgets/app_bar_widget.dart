import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTapButton;
  final VoidCallback? onTapRefreshButton;
  final int index;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.onTapButton,
    required this.index,
    this.onTapRefreshButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
        ),
        child: Column(
          children: [
            const SizedBox(height: kSizedBoxHeight),
            Stack(
              children: [
                if (index == 2) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Image.asset(
                        menuIconButton,
                        width: kIconSize,
                        height: kIconSize,
                      ),
                      onPressed: () {},
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
                        reloadIconButton,
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);
}
