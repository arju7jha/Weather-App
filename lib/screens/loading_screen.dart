import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_app/services/weather.dart';

const apikey = 'fd161c136881841743dccbcd23c3f106';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
    //print('This line of code is triggred');
  }

  void getLocationData() async {
    var weatherData =await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.tealAccent,
          size: 100,
        ),
      ),
    );
  }
}

//var decodeData = jsonDecode(data);

// double temperature = decodeData['main']['temp'];
// int condition = decodeData['weather'][0]['id'];
// String city = decodeData['name'];
//
// print(temperature);
// print(condition);
// print(city);
