import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.onPreviousTap,
    required this.title,
    required this.leftIcon,
    this.rightIcon,
    this.isNext = false,
    this.onNextTap,
  });

  final Widget title;
  final VoidCallback onPreviousTap;
  final VoidCallback? onNextTap;
  final bool isNext;
  final String leftIcon;
  final String? rightIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingHorizontal,
        ),
        child: Column(
          children: [
            const SizedBox(height: kSizedBoxHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    leftIcon,
                    width: kIconSize,
                    height: kIconSize,
                  ),
                  onPressed: onPreviousTap,
                ),
                title,
                isNext
                    ? IconButton(
                        icon: Image.asset(
                          rightIcon ?? '',
                          width: kIconSize,
                          height: kIconSize,
                        ),
                        onPressed: onPreviousTap,
                      )
                    : const SizedBox(
                        width: kIconSize,
                        height: kIconSize,
                      )
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
