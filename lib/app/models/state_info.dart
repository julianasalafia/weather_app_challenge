import 'day.dart';
import 'information_weather_result.dart';

class StateInfo {
  final String state;
  final Map<DaysWeekEnum, Day> days;

  const StateInfo._({
    required this.state,
    required this.days,
  });

  factory StateInfo.fromJson(dynamic json) {
    final dias = json['dias'][0];
    Map<DaysWeekEnum, Day> mapDay = {};

    for (final day in DaysWeekEnum.values) {
      mapDay[day] = Day.fromJson(dias[day.name][0]);
    }

    return StateInfo._(
      state: json['estado'],
      days: mapDay,
    );
  }

  Day? getToday() {
    final today = DateTime.now().weekday;
    final day = days[DaysWeekEnum.values[today - 1]];

    return day;
  }

  String getTodayName() {
    final today = DateTime.now().weekday;
    final day = DaysWeekEnum.values[today - 1].label;

    return day;
  }

  static List<StateInfo> fromListJson(dynamic list) {
    final List<StateInfo> result = [];

    for (var o in list) {
      result.add(StateInfo.fromJson(o));
    }
    return result;
  }
}
