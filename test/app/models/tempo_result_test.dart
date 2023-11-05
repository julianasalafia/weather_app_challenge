import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_challenge/app/models/weather_result.dart';

import '../../mock/mock.dart';

void main() {
  test('Deve converter o json na classe tempo result', () async {
    // arrange
    const responseApi = mockTempoResult;

    // act
    final result = WeatherResult.fromJson(responseApi);

    // assert
    expect(result, isA<WeatherResult>());
  });
}
