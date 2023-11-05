import 'package:weather_app_challenge/app/models/state_info.dart';
import 'package:weather_app_challenge/app/utils/helpers/information_weather_helper.dart';

class InformationWeatherResult with InformationWeatherHelper {
  final List<StateInfo> states;

  const InformationWeatherResult._({required this.states});

  factory InformationWeatherResult.fromJson(dynamic json) {
    return InformationWeatherResult._(
      states: StateInfo.fromListJson(json['result']['estados']),
    );
  }
}

enum DaysWeekEnum {
  segunda(id: 0, label: 'Segunda'),
  terca(id: 1, label: 'Terça'),
  quarta(id: 2, label: 'Quarta'),
  quinta(id: 3, label: 'Quinta'),
  sexta(id: 4, label: 'Sexta'),
  sabado(id: 5, label: 'Sábado'),
  domingo(id: 6, label: 'Domingo');

  final int id;
  final String label;

  const DaysWeekEnum({required this.id, required this.label});
}

enum PeriodsEnum {
  manha(id: 0, label: 'Manhã'),
  tarde(id: 1, label: 'Tarde'),
  noite(id: 2, label: 'Noite');

  final int id;
  final String label;

  const PeriodsEnum({required this.id, required this.label});
}
