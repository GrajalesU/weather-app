import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/widgets/weather/main_info.dart';
import 'package:weather_app/widgets/weather/secondary_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration:
                            const BoxDecoration(color: Colors.deepOrange),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${state.weather.areaName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Buen día',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            MainInfo(
                                temperature:
                                    '${state.weather.temperature!.celsius!.round()}° C',
                                date: DateFormat('EEEE dd •  h:mm a', 'es')
                                    .format(state.weather.date!),
                                status: state.weather.weatherDescription!
                                    .toUpperCase()),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SecondaryInfo(
                                      text: 'Amanecer',
                                      value: DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                      assetSource: 'assets/11.png'),
                                  SecondaryInfo(
                                      text: 'Puesta de sol',
                                      value: DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      assetSource: 'assets/12.png'),
                                ]),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SecondaryInfo(
                                      text: 'Temperatura máxima',
                                      value:
                                          '${state.weather.tempMax!.celsius!.round()}° C',
                                      assetSource: 'assets/13.png'),
                                  SecondaryInfo(
                                      text: 'Temperatura mínima',
                                      value:
                                          '${state.weather.tempMin!.celsius!.round()}° C',
                                      assetSource: 'assets/14.png'),
                                ]),
                          ]),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
        ));
  }
}
