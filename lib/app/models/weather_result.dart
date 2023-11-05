class WeatherResult {
  final List<String> states;

  const WeatherResult._({required this.states});

  factory WeatherResult.fromJson(dynamic json) {
    return WeatherResult._(
      states: fromListJson(json['result']['estados']),
    );
  }

  static List<String> fromListJson(dynamic list) {
    final List<String> result = [];

    for (var o in list) {
      result.add(o.toString());
    }
    return result;
  }
}
