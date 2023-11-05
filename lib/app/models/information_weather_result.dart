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

class Day {
  final Map<PeriodsEnum, Period> periods;

  const Day._({
    required this.periods,
  });

  factory Day.fromJson(dynamic json) {
    final Map<PeriodsEnum, Period> periods = {};
    for (final period in PeriodsEnum.values) {
      periods[period] = Period.fromJson(json[period.name][0]);
    }

    final result = Day._(
      periods: periods,
    );
    return result;
  }

  MapEntry<PeriodsEnum, Period> getPeriodNow() {
    final hourNow = DateTime.now().hour;

    if (hourNow >= 6 && hourNow <= 12) {
      final period = periods.entries.toList()[0];
      return period;
    } else if (hourNow >= 13 && hourNow <= 18) {
      final period = periods.entries.toList()[1];
      return period;
    } else {
      final period = periods.entries.toList()[2];
      return period;
    }
  }
}

class Period {
  final String weather;
  final String degrees;

  const Period._({
    required this.weather,
    required this.degrees,
  });

  factory Period.fromJson(dynamic json) {
    return Period._(
      weather: json['tempo'],
      degrees: json['graus']?.toString() ?? '0',
    );
  }
}
