import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';

import '../../controller/weather_controller/weather_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/home_page_weather_widget.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onStateTapped;
  const HomePage({super.key, required this.onStateTapped});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with InformacoesTempoHelper {
  late WeatherController tempoStore;

  @override
  void initState() {
    super.initState();
    tempoStore = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      tempoStore.loadInformacaoTempoResult();
      tempoStore.loadTempoResult();
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
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: store.informacoesTempoResult?.estados.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return HomePageWeatherWidget(
                    image: getImagePath(store
                            .informacoesTempoResult?.estados[index]
                            .getToday()
                            ?.getPeriodoNow()
                            .value
                            .tempo ??
                        ''),
                    state:
                        store.informacoesTempoResult?.estados[index].estado ??
                            '',
                    onTap: () {
                      store.onSelectState(
                          store.informacoesTempoResult!.estados[index]);
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
