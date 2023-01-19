import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather/constants/constants.dart';
import 'package:open_weather/cubits/weather/weather_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSuscription;
  final WeatherCubit weatherCubit;

  ThemeCubit({required this.weatherCubit}) : super(ThemeState.initial()) {
    weatherSuscription = weatherCubit.stream.listen((weatherState) {
      if (weatherState.weather.temp > kWarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }

  @override
  Future<void> close() {
    weatherSuscription.cancel();
    return super.close();
  }
}
