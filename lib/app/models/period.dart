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
