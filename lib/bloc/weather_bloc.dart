import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        await dotenv.load(); // Load the file ".env"
        String apiKey = dotenv.env['API_KEY'] ?? "";

        WeatherFactory weatherFactory =
            WeatherFactory(apiKey, language: Language.SPANISH);
        Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );

        List<Weather> forecast = await weatherFactory.fiveDayForecastByLocation(
          event.position.latitude,
          event.position.longitude,
        );

         List<List<Weather>> dailyForecast = _separateForecastByDays(forecast);

        emit(WeatherSuccess(weather, dailyForecast));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }

  List<List<Weather>> _separateForecastByDays(List<Weather> forecast) {
    Map<int, List<Weather>> separatedForecastMap = {};

    // Iterar sobre el pronóstico y agruparlo por días
    for (Weather weather in forecast) {
      int day = DateTime.fromMillisecondsSinceEpoch(weather.date!.millisecondsSinceEpoch).day;

      if (!separatedForecastMap.containsKey(day)) {
        separatedForecastMap[day] = [];
      }

      separatedForecastMap[day]!.add(weather);
    }

    // Convertir el mapa a una lista de listas
    List<List<Weather>> separatedForecast = separatedForecastMap.values.toList();

    return separatedForecast;
  }
}
