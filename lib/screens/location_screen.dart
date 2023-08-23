// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

late String country;
late String town;
late String weatherType;
late double temp;
late int id;
late String icon;
late String description;
late int tempToInt;

WeatherModel weatherModel = WeatherModel();

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final dynamic weatherData;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
    print("Hellloooooo");
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        country = "";
        town = "Not detected";
        weatherType = "Cant predict";
        temp = 0;
        tempToInt = temp.toInt();
        id = 0;
        icon = "";
        description = "";
        return;
      } else {
        country = data['sys']['country'];
        town = data['name'];
        weatherType = data['weather'][0]['main'];

        id = data['weather'][0]['id'];

        temp = data['main']['temp'];
        tempToInt = temp.toInt();
        icon = weatherModel.getWeatherIcon(id);

        description = weatherModel.getMessage(tempToInt).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // country = widget.weatherData['sys']['country'];
    // town = widget.weatherData['name'];
    // weatherType = widget.weatherData['weather'][0]['main'];

    // id = widget.weatherData['weather'][0]['id'];

    // temp = widget.weatherData['main']['temp'];
    // tempToInt = temp.toInt();
    // icon = weatherModel.getWeatherIcon(id);

    // description = weatherModel.getMessage(tempToInt).toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CityScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                "$town, $country",
                style: kButtonTextStyle,
              ),
              Text(
                weatherType,
                style: kSmallTextStyle,
              ),
              Text(
                icon,
                style: kConditionTextStyle,
              ),
              Text(
                '$tempToInt °',
                style: kTempTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 35.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
