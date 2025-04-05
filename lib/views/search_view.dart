import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/getWeatherCubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

import '../Cubits/getWeatherCubit.dart';

class searchView extends StatelessWidget {
  const searchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                hintText: "Inter City Name",
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                ))),
          ),
        ),
      ),
    );
  }
}
