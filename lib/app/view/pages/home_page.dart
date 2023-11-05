import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/models/information_weather_helper.dart';
import 'package:weather_app_challenge/app/utils/app_colors.dart';

import '../../controller/weather_controller/weather_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_page_weather_widget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onStateTapped;
  const HomePage({super.key, required this.onStateTapped});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with InformationWeatherHelper {
  late WeatherController tempoStore;

  @override
  void initState() {
    super.initState();
    tempoStore = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      tempoStore.loadInformationWeatherResult();
      tempoStore.loadWeatherResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Search for City',
        onTapButton: () {},
        index: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Consumer<WeatherController>(builder: (context, store, _) {
        return store.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.lightPurple),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          store.informationWeatherResult?.states.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return HomePageWeatherWidget(
                          image: getImagePath(store
                                  .informationWeatherResult?.states[index]
                                  .getToday()
                                  ?.getPeriodNow()
                                  .value
                                  .weather ??
                              ''),
                          state: store.informationWeatherResult?.states[index]
                                  .state ??
                              '',
                          onTap: () {
                            store.onSelectState(
                                store.informationWeatherResult!.states[index]);
                            widget.onStateTapped();
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
