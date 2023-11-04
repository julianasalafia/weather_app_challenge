import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';
import 'package:weather_app_challenge/store/tempo_store.dart';
import '../widgets/home_page_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with InformacoesTempoHelper {
  late TempoStore tempoStore;

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
      backgroundColor: Colors.transparent,
      body: Consumer<TempoStore>(builder: (context, store, widget) {
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
                            ?.tempo ??
                        ''),
                    state:
                        store.informacoesTempoResult?.estados[index].estado ??
                            '',
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
