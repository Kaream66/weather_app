import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            themeMode: ThemeMode.system,
            theme: ThemeData(
              primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Cloudy':
    case 'Overcast':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Thundery outbreaks possible':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Mist':
    case 'Patchy sleet possible':
      return Colors.grey;
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.grey;
    default:
      return Colors.blue;
  }
}
