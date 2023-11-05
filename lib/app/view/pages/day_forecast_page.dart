import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import '../controller/tempo_controller.dart';
import '../widgets/state_temperature_small_widget.dart';
import '../widgets/temperature_date_widget.dart';
import '../widgets/temperature_small_widget.dart';

class DayForecastPage extends StatelessWidget {
  final VoidCallback onItemTapped;
  final VoidCallback onPeriodTap;

  const DayForecastPage({
    super.key,
    required this.onItemTapped,
    required this.onPeriodTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<TempoController>(builder: (context, store, widget) {
      final day = store.selectedDay!;
      return Scaffold(
        appBar: AppBarWidget(
          title: store.selectedState?.estado ?? 'Cidade',
          onTapButton: () {},
          onTapRefreshButton: store.refresh,
          isRefreshing: store.isRefreshing,
          index: 2,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 750,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TemperatureDateWidget(
                  theme: theme,
                  dia: store.selectedDay!,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, bottom: 5, left: 10),
                        child: Text(
                          'Hoje',
                          style: theme.appBarTheme.titleTextStyle
                              ?.copyWith(fontSize: 12),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: day.value.periodos.values.length,
                          itemBuilder: (BuildContext context, int index) {
                            final periodo =
                                day.value.periodos.entries.toList()[index];

                            return TemperatureSmallWidget(
                              theme: theme,
                              periodo: periodo,
                              onTap: onPeriodTap,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 10),
                        child: Text(
                          'Estados',
                          style: theme.appBarTheme.titleTextStyle
                              ?.copyWith(fontSize: 12),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              store.informacoesTempoResult?.estados.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return StateTemperatureSmallWidget(
                              theme: theme,
                              state:
                                  store.informacoesTempoResult!.estados[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
