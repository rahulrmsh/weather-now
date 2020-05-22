import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:climate/utilities/constants.dart';
import 'package:climate/services/appdrawer.dart';


class ResultPage extends StatelessWidget {
  ResultPage({@required this.city, @required this.country, @required this.climate, @required this.description, @required this.date, @required this.temp, @required this.iconData, @required this.imageData, @required this.day});
  final String city;
  final String date;
  final String climate;
  final String description;
  final String temp;
  final String country;
  final IconData iconData;
  final AssetImage imageData;
  final String day;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return  SafeArea(
      child: Container(
        child: Scaffold(
        appBar: AppBar(
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
            canvasColor: Colors.white,
            backgroundColor: Colors.black,
            primaryColor: Colors.black,
          ),
        ),
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment(-1.0,0.0),
                  margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 8.5),
                  child: Row(
                    children: <Widget>[
                      Icon(OMIcons.locationOn, size: 28.0, color: Colors.grey.shade900,),
                      Text(' '+city+','+country,style: TextStyle( color: Colors.grey.shade900, fontSize: 24.0, fontFamily: 'SourceSansPro-Regular', fontWeight: FontWeight.w100),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsetsDirectional.only(top: 40.0),
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Today',style: TextStyle( color: Colors.grey.shade900, fontSize: 36.0, fontFamily: 'AUBREY1', fontWeight: FontWeight.w300),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 8.0, left: 20.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(child: Text(temp.toString()+'\u00B0'+'C',style: TextStyle( color: Colors.grey.shade900, fontSize: 54.0, fontFamily: 'ViaodaLibre-Regular', fontWeight: FontWeight.w600),)),
                                Container(child: Text(climate,style: TextStyle( color: Colors.grey.shade900, fontSize: 34.0, fontFamily: 'AUBREY1', fontWeight: FontWeight.w500),)),
                                Text(date+', '+day, style: TextStyle( color: Colors.grey.shade900, fontSize: 26.0, fontFamily: 'AUBREY1', fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          Container(padding: EdgeInsetsDirectional.only(start: 0.0, bottom: 53.0, end: 20.0),child: Icon(iconData, size: 110.0, color: Colors.grey.shade900)),
                        ],
                      ),
                      Container(padding: EdgeInsetsDirectional.only(top: 45.0, bottom: 30.0,),child: Text(description, style: TextStyle( color: Colors.grey.shade900, fontSize: 28.0, fontFamily: 'AUBREY1', fontWeight: FontWeight.w300),)),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 6,child: Image(fit: BoxFit.fitWidth ,image: imageData)),
            ],
          ),
        ),
      )
    );
  }
}

