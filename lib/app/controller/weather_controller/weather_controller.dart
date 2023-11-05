import 'package:flutter/material.dart';
import '../../models/day.dart';
import '../../models/days_week_enum.dart';
import '../../models/information_weather_result.dart';
import '../../models/state_info.dart';
import '../../models/weather_result.dart';
import '../http_controller/i_http_service.dart';

class WeatherController with ChangeNotifier {
  final IHttpService service;
  InformationWeatherResult? informationWeatherResult;
  WeatherResult? weatherResult;
  StateInfo? selectedState;
  MapEntry<DaysWeekEnum, Day>? selectedDay;
  bool isRefreshing = false;
  bool isLoading = false;

  WeatherController({required this.service});

  Future<void> loadInformationWeatherResult() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));

    final result = await service.post(url: 'informacoes_do_tempo');
    informationWeatherResult = InformationWeatherResult.fromJson(result.data);
    if (selectedState == null && informationWeatherResult != null) {
      selectedState = informationWeatherResult?.states.first;
      selectedDay = selectedState!.days.entries.first;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadWeatherResult() async {
    final result = await service.post(url: 'tempo');
    weatherResult = WeatherResult.fromJson(result.data);

    notifyListeners();
  }

  void onSelectState(StateInfo state) {
    selectedState = state;
    notifyListeners();
  }

  void onSelectDay(MapEntry<DaysWeekEnum, Day> day) {
    selectedDay = day;
    notifyListeners();
  }

  Future<void> refresh() async {
    isRefreshing = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    loadInformationWeatherResult();
    isRefreshing = false;
    notifyListeners();
  }
}
