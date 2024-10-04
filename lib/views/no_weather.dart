import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'There is no weather ,start searching now',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ));
  }
}
