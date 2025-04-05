import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/getWeatherCubit.dart';
import 'package:weather_app/Cubits/getWeatherCubit/getewatherstates.dart';
import 'package:weather_app/Widget/no_weather.dart';
import 'package:weather_app/Widget/weather_info.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Weather')),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return searchView();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherstate) {
              return noWeather();
            } else if (state is WeatherLoadedstate) {
              return weatherInfo(
                weatherModel: state.weatherModel,
              );
            } else {
              return Text('Opps thare is error !');
            }
          },
        ));
  }
}
