import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/utils/helpers/information_weather_helper.dart';
import 'package:weather_app_challenge/app/view/widgets/app_bar_widget.dart';

import '../../controller/weather_controller/weather_controller.dart';
import '../../utils/constants.dart';
import '../widgets/information_widget.dart';

class InformationPage extends StatefulWidget {
  final VoidCallback onItemTapped;
  const InformationPage({super.key, required this.onItemTapped});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with InformationWeatherHelper {
  late WeatherController weatherController;

  @override
  void initState() {
    super.initState();
    weatherController = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      weatherController.loadInformationWeatherResult();
      weatherController.loadWeatherResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarWidget(
        title: informationsTitle,
        onTapButton: widget.onItemTapped,
        index: 3,
      ),
      body: Consumer<WeatherController>(
        builder: (context, store, widget) {
          return Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount:
                      weatherController.weatherResult?.states.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InformationWidget(
                      theme: theme,
                      image: getImagePath(
                          weatherController.weatherResult!.states[index]),
                      title: weatherController.weatherResult!.states[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
