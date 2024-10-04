class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double average;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.average,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromjason(jason) {
    return WeatherModel(
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: jason['location']['name'],
      date: DateTime.parse(jason['current']['last_updated']),
      average: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
