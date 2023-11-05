import 'package:flutter/material.dart';

import 'app/utils/app_colors.dart';
import 'app/view/pages/day_forecast_page.dart';
import 'app/view/pages/home_page.dart';
import 'app/view/pages/informations_page.dart';
import 'app/view/pages/week_forecast_page.dart';
import 'app/view/themes/dark/dark_theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [];

  @override
  void initState() {
    super.initState();

    pages.clear();
    pages.addAll(
      [
        HomePage(
          onStateTapped: () => _onItemTapped(1),
        ),
        WeekForecastPage(
          onItemTapped: () => _onItemTapped(0),
          onDayTapped: () => _onItemTapped(2),
        ),
        DayForecastPage(
          onItemTapped: () => _onItemTapped(1),
          onPeriodTap: () => _onItemTapped(3),
        ),
        InformationsPage(onItemTapped: () => _onItemTapped(2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
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
      ),
    );
  }
}
