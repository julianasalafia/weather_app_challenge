class TempoResult {
  final List<String> estados;

  const TempoResult._({required this.estados});

  factory TempoResult.fromJson(dynamic json) {
    return TempoResult._(
      estados: fromListJson(json['result']['estados']),
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
