part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Weather weather;
  final List<List<Weather>> dailyForecast;

  const WeatherSuccess(this.weather, this.dailyForecast);

  @override
  List<Object> get props => [weather];
}
