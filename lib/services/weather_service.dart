import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '12dbe3015e6243d4bd0142218241603';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromjason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error, Try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error, Try later');
    }
  }
}

    // if (response.statusCode == 201) {
    //   WeatherModel weatherModel = WeatherModel.fromjason(response.data);
    //   return weatherModel;
    // } else {
    //   final String errorMessage = response.data['error']['message'];
    //   throw Exception(errorMessage);
    // }
