import 'package:weather_app_challenge/app/models/period.dart';
import 'package:weather_app_challenge/app/models/periods_enum.dart';

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
