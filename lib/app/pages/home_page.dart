import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import 'package:weather_app_challenge/app/utils/constants.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import 'package:weather_app_challenge/app/widgets/custom_bottom_bar.dart';
import 'package:weather_app_challenge/store/tempo_store.dart';
import '../widgets/home_page_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final theme = Theme.of(context);
    return Container(
      decoration: DarkTheme.darkGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(
          isNext: false,
          onPreviousTap: () {
            // TODO
          },
          title: Text(
            toolbarSearchTitle,
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: Consumer<TempoStore>(builder: (context, store, widget) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: store.informacoesTempoResult?.estados.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return HomePageWeatherWidget(
                      // TODO: Mapear o tempo para as imagens
                      image: 'assets/images/cloudy_weather.png',
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
      ),
    );
  }
}
