import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';

Location currentLocation = Location();
late double latitude;
late double longitude;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    if (!mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weatherData: weatherData),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.orange,
        size: 50,
      ),
    );
  }
}
