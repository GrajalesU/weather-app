import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/widgets/weather/weather_forecast_card.dart';

class WeatherForecastList extends StatelessWidget {
  final List<List<Weather>> dailyForecast;

  const WeatherForecastList({
    Key? key,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: dailyForecast.map((day) {
          return Column(
            children: [
              Text(
                '${DateFormat('EEEE dd', 'es').format(day[0].date!).toUpperCase()} DE ${DateFormat('MMMM', 'es').format(day[0].date!).toUpperCase()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              ...day.map((weatherElement) {
                return WeatherForecastCard(weather: weatherElement);
              }).toList()
            ],
          );
        }).toList(),
      ),
    );
  }
}
