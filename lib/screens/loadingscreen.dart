import 'package:climate/screens/errorscreen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:climate/screens/resultspage.dart';
import 'package:climate/services/appdrawer.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:climate/utilities/constants.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  String lat = position.latitude.toString();
  String lon = position.longitude.toString();
  getData(lat, lon);
  }
  
  void getData(String lat, String lon) async{
    Response response;
    try{
      response = await get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=591569bc1f75d583f1852071bad7236d');
      int code = response.statusCode;
      if(code == 200)
      {
        String data = response.body;
        String climate = jsonDecode(data)['weather'][0]['main'];
        String description = jsonDecode(data)['weather'][0]['description'];
        String city = jsonDecode(data)['name'];
        String country = jsonDecode(data)['sys']['country'];
        String temp = (jsonDecode(data)['main']['temp']-273.15).toStringAsFixed(2);
        AssetImage imageData;
        IconData iconData;
        int dateKey = DateTime.now().weekday.toInt();
        List <String> list = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday'];
        String day = list[dateKey-1];
        print(data);
        switch(climate){
          case 'Rain':
            iconData = WeatherIcons.rain;
            imageData = AssetImage('images/flatillustraion7.jpg');
            break;
          case 'Thunderstorm':
            iconData = WeatherIcons.thunderstorm;
            imageData = AssetImage('images/flatillustraion19.jpg');
            break;
          case 'Drizzle':
            iconData = WeatherIcons.rain_wind;
            imageData = AssetImage('images/flatillustraion14.png');
            break;
          case 'Snow':
            iconData = WeatherIcons.snow;
            imageData = AssetImage('images/flatillustraion12.jpg');
            break;
          case 'Smoke':
            iconData = WeatherIcons.smoke;
            imageData = AssetImage('images/flatillustraion21.png');
            break;
          case 'Dust':
            iconData = WeatherIcons.dust;
            imageData = AssetImage('images/flatillustraion15.jpg');
            break;
          case 'Sand':
            iconData = WeatherIcons.sandstorm;
            imageData = AssetImage('images/flatillustraion13.jpg');
            break;
          case 'Ash':
            iconData = WeatherIcons.volcano;
            imageData = AssetImage('images/flatillustraion17.jpg');
            break;
          case 'Squall':
            iconData = WeatherIcons.storm_showers;
            imageData = AssetImage('images/flatillustraion16.jpg');
            break;
          case 'Tornado':
            iconData = WeatherIcons.tornado;
            imageData = AssetImage('images/flatillustraion6.jpg');
            break;
          case 'Clear':
            iconData = WeatherIcons.day_sunny;
            imageData = AssetImage('images/flatillustraion9.jpg');
            break;  
          case 'Clouds':
            iconData = WeatherIcons.cloud;
            imageData = AssetImage('images/flatillustraion8.jpg');
            break;
          case 'Haze':
            iconData = WeatherIcons.day_haze;
            imageData = AssetImage('images/flatillustraion20.png');
            break;
          case 'Mist':
            iconData = WeatherIcons.fog;
            imageData = AssetImage('images/flatillustraion6.jpg');
            break;
          default:
            iconData = WeatherIcons.day_light_wind;
            imageData = AssetImage('images/flatillustraion7.jpg');
            break;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
          city: city, 
          climate: climate, 
          country: country, 
          temp: temp, 
          description: description, 
          iconData: iconData,
          imageData: imageData,
          day: day,
          date: DateTime.now().day.toString(),
          ),
         ),
        );
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorPage()));
      }
    }
    catch(e)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ErrorPage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 6.0,
          leading: Builder(builder: (BuildContext context) {return IconButton(icon: Icon(OMIcons.menu, color: Colors.black, size: 40.0,), onPressed: (){ Scaffold.of(context).openDrawer();}, tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip, );},),
          title: Text(
                  'Weather',
                  style: headingStyle,
                ),
          centerTitle: true,
          backgroundColor: mainHeaderColor,
        ),
        drawer: Theme(
          child: AppDrawer(
            imageKey: AssetImage('images/flatillustraion10.gif'),
          ),
          data: Theme.of(context).copyWith(
            canvasColor: mainHeaderColor,
            backgroundColor: Colors.black,
            primaryColor: Colors.black,
          ),
        ),
        backgroundColor: mainHeaderColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(top: 60.0, bottom: 80.0),
                    child: AnalogClock(
                      decoration: BoxDecoration(color: mainHeaderColor, shape: BoxShape.circle),
                      width: 320.0,
                      isLive: true,
                      showSecondHand: true,
                      minuteHandColor: Colors.black54,
                      hourHandColor: Colors.black,
                      secondHandColor: Colors.red,
                      showNumbers: true,
                      showTicks: true,
                      height: 300.0,
                      showAllNumbers: false,
                      showDigitalClock: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(top: 40.0,bottom: 60.0),
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    child: RaisedButton(
                      color: Colors.lightBlue[800],
                      onPressed: (){
                        setState(() {
                          getLocation();
                          },
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 30.5, vertical: 8.5),
                      child: Text(
                        'Get  Weather',
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

