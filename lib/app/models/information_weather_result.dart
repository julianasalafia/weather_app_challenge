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
