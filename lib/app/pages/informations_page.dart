import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';
import 'package:weather_app_challenge/app/widgets/app_bar_widget.dart';
import '../../store/tempo_store.dart';
import '../widgets/information_widget.dart';

class InformationsPage extends StatefulWidget {
  final VoidCallback onItemTapped;
  const InformationsPage({super.key, required this.onItemTapped});

  @override
  State<InformationsPage> createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage>
    with InformacoesTempoHelper {
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
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Informações',
        onTapButton: widget.onItemTapped,
        index: 3,
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
                      image:
                          getImagePath(tempoStore.tempoResult!.estados[index]),
                      title: tempoStore.tempoResult!.estados[index],
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
