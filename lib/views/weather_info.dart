import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weatherCondition),
        getThemeColor(weatherModel.weatherCondition)[300]!,
        getThemeColor(weatherModel.weatherCondition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https:${weatherModel.image}"),
                const SizedBox(
                  width: 32,
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  weatherModel.average.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp:${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    Text('MinTemp:${weatherModel.minTemp.round()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(weatherModel.weatherCondition,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
