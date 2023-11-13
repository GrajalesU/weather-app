import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/widgets/weather/secondary_info.dart';

class WeatherDetails extends StatelessWidget {
  final Weather weather;

  const WeatherDetails({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SecondaryInfo(
              text: 'Amanecer',
              value: DateFormat().add_jm().format(weather.sunrise!),
              assetSource: 'assets/11.png'),
          SecondaryInfo(
              text: 'Puesta de sol',
              value: DateFormat().add_jm().format(weather.sunset!),
              assetSource: 'assets/12.png'),
        ]),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SecondaryInfo(
              text: 'Temperatura máxima',
              value: '${weather.tempMax!.celsius!.round()}° C',
              assetSource: 'assets/13.png'),
          SecondaryInfo(
              text: 'Temperatura mínima',
              value: '${weather.tempMin!.celsius!.round()}° C',
              assetSource: 'assets/14.png'),
        ]),
      ],
    );
  }
}
