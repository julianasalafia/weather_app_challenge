import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -5,
      left: 0,
      right: 0,
      child: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: const Icon(Icons.home),
            activeIcon: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightPurple,
                    AppColors.lightMidPurple,
                  ],
                ),
              ),
              child: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: const Icon(Icons.search),
            activeIcon: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightPurple,
                    AppColors.lightMidPurple,
                  ],
                ),
              ),
              child: const Icon(Icons.search),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: const Icon(Icons.person_outline),
            activeIcon: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightPurple,
                    AppColors.lightMidPurple,
                  ],
                ),
              ),
              child: const Icon(Icons.person_outline),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Alert',
            icon: const Icon(Icons.notifications_none_outlined),
            activeIcon: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.lightPurple,
                    AppColors.lightMidPurple,
                  ],
                ),
              ),
              child: const Icon(Icons.notifications_none_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
