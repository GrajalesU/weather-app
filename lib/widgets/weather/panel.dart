import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/widgets/weather/weather_details.dart';
import 'package:weather_app/widgets/weather/weather_forecast_list.dart';

class Panel extends StatelessWidget {
  final ScrollController controller;
  final Weather weather;
  final List<List<Weather>> dailyForecast;

  const Panel({
    Key? key,
    required this.controller,
    required this.weather,
    required this.dailyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        Material(
          type: MaterialType.transparency,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    WeatherDetails(weather: weather),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 3,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'PRONÓSTICO',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: WeatherForecastList(
                        dailyForecast: dailyForecast,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
