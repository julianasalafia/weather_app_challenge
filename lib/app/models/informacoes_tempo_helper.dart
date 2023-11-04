const sun = 'sol';
const cloudy = 'nublado';
const rain = 'chuva';
const snow = 'neve';
const storm = 'tempestade';
const thunder = 'trovão';

mixin InformacoesTempoHelper {
  String getImagePath(String weather) => switch (weather.toLowerCase()) {
        sun => 'assets/images/sun.png',
        cloudy => 'assets/images/cloudy.png',
        rain => 'assets/images/rain.png',
        snow => 'assets/images/snow.png',
        storm => 'assets/images/storm.png',
        thunder => 'assets/images/thunder.png',
        _ => 'assets/images/sun.png',
      };
}
