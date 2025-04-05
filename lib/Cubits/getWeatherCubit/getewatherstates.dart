import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherstate extends WeatherState {}

class WeatherLoadedstate extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedstate(this.weatherModel);
}

class WeatherErrorState extends WeatherState {}
