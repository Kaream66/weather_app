import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.amber,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeather();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo(
              weather: state.weatherModel,
            );
          } else {
            return const Text('Oops There was an error');
          }
        },
      ),
    );
  }
}
