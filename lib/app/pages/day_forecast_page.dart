import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/tempo_store.dart';
import '../models/informacoes_tempo_result.dart';
import '../widgets/state_temperature_small_widget.dart';
import '../widgets/temperature_date_widget.dart';
import '../widgets/temperature_small_widget.dart';

class DayForecastPage extends StatelessWidget {
  final VoidCallback onItemTapped;
  const DayForecastPage({
    super.key,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Consumer<TempoStore>(
        builder: (context, store, widget) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 750,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TemperatureDateWidget(theme: theme),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 5, left: 10),
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
                            itemCount: store
                                .informacoesTempoResult
                                ?.estados[0]
                                .dias[DiasSemanaEnum.segunda]
                                ?.periodos
                                .values
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              final periodo = store
                                  .informacoesTempoResult
                                  ?.estados[0]
                                  .dias[DiasSemanaEnum.segunda]
                                  ?.periodos
                                  .values
                                  .elementAt(index);

                              return TemperatureSmallWidget(
                                  theme: theme, periodo: periodo!);
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
                                store.informacoesTempoResult?.estados.length ??
                                    0,
                            itemBuilder: (BuildContext context, int index) {
                              return StateTemperatureSmallWidget(
                                  theme: theme,
                                  state: store.informacoesTempoResult
                                          ?.estados[index].estado ??
                                      '');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
