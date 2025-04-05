import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com';
  final String apiKey = '9c944a5f4de04ce4bf7101432240102';
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? 'oops error :( try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops error :( try later ');
    }
  }
}
