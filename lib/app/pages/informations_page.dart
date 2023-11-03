import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/themes/dark/dark_theme.dart';
import '../../store/tempo_store.dart';
import '../utils/constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/information_widget.dart';

class InformationsPage extends StatefulWidget {
  const InformationsPage({super.key});

  @override
  State<InformationsPage> createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
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
        appBar: AppBarWidget(
          isNext: false,
          onPreviousTap: () {
            Navigator.pop(context);
          },
          title: Text(
            toolbarInformationTitle,
            style: theme.appBarTheme.titleTextStyle,
          ),
          leftIcon: backIconButton,
        ),
        body: Consumer<TempoStore>(
          builder: (context, store, widget) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    itemCount: tempoStore.tempoResult?.estados.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InformationWidget(
                        theme: theme,
                        image: 'assets/images/sun.png',
                        title: tempoStore.tempoResult!.estados[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
