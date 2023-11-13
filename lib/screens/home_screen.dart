import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/utils/get_weather_icon.dart';
import 'package:weather_app/widgets/background.dart';
import 'package:weather_app/widgets/weather/panel.dart';
import 'package:weather_app/widgets/weather/main_info.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherSuccess) {
        return SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 0.05,
          body: Scaffold(
              backgroundColor: Colors.black,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark),
              ),
              body: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        const Background(),
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
                                getWeatherIcon(
                                    state.weather.weatherConditionCode!, 1),
                                MainInfo(
                                    temperature:
                                        '${state.weather.temperature!.celsius!.round()}° C',
                                    date: DateFormat('EEEE dd •  h:mm a', 'es')
                                        .format(state.weather.date!),
                                    status: state.weather.weatherDescription!
                                        .toUpperCase()),
                              ]),
                        )
                      ],
                    ),
                  ))),
          panelBuilder: (controller) => Panel(
            controller: controller,
            weather: state.weather,
            dailyForecast: state.dailyForecast,
          ),
          minHeight: 200,
          maxHeight: MediaQuery.of(context).size.height,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        );
      } else {
        return Container();
      }
    });
  }
}
