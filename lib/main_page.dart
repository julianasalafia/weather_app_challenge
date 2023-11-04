import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import 'package:weather_app_challenge/store/tempo_store.dart';
import 'app/pages/day_forecast_page.dart';
import 'app/pages/home_page.dart';
import 'app/pages/informations_page.dart';
import 'app/pages/week_forecast_page.dart';
import 'app/themes/dark/dark_theme.dart';
import 'app/utils/app_colors.dart';
import 'app/utils/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final pages = [
    const HomePage(),
    const WeekForecastPage(),
    DayForecastPage(),
    const InformationsPage(),
  ];

  final titles = [
    'Search for City',
    '7 Dias',
    'Espírito Santo',
    'Informações',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        appBar: AppBarWidget(
          onTapRefreshButton: () =>
              context.watch<TempoStore>().informacoesTempoResult,
          onTapButton: () {
            _onItemTapped(_selectedIndex - 1);

            if (_selectedIndex < 0) {
              _selectedIndex = 0;
            }
          },
          title: titles[_selectedIndex],
          index: _selectedIndex,
        ),
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
