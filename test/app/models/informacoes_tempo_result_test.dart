import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_challenge/app/models/information_weather_result.dart';

import '../../mock/mock.dart';

void main() {
  test('Deve converter o json na classe informações tempo result', () async {
    // arrange
    const responseApi = mockResult;

    // act
    final result = InformationWeatherResult.fromJson(responseApi);

    // assert
    expect(result, isA<InformationWeatherResult>());
  });
}
