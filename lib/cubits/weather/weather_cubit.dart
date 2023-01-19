import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather/models/custom_error.dart';
import 'package:open_weather/models/weather.dart';
import 'package:open_weather/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    try {
      emit(state.copyWith(
        status: WeatherStatus.loading,
      ));
      final weather = await weatherRepository.fetchWeather(city);
      emit(state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: e,
      ));
    }
  }
}
