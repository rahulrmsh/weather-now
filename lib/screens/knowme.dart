import 'package:climate/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:climate/services/appdrawer.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class KnowMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SafeArea(
          child: Scaffold(
            backgroundColor: mainHeaderColor,
            appBar:  AppBar(
              leading: Builder(builder: (BuildContext context) {return IconButton(icon: Icon(OMIcons.menu, color: Colors.black, size: 40,), onPressed: (){ Scaffold.of(context).openDrawer();}, tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip, );},),
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
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   CircleAvatar(
                     radius: 90.0,
                     backgroundImage: AssetImage('images/file1.jpg'), 
                   ),
                   Container(
                     padding: EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
                     child: Text('Rahul R',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                        fontFamily: 'AUBREY1',
                      ),
                     ),
                   ),
                   Text('STUDENT - CSE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 2.5,
                      wordSpacing: 4,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SourceSansPro-Regular',
                    ),
                   ),
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.all(
                         Radius.circular(10),
                       ),
                     ),
                     margin: EdgeInsets.symmetric(
                       vertical: 15,
                       horizontal: 25,
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Row(
                         children: <Widget>[
                           Icon(
                             Icons.call,
                             size: 25, 
                             color: Colors.black87,
                             ),
                            SizedBox(
                               width: 10.0,
                             ),
                            Text('+91-8086-2375-40',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontFamily: 'SourceSansPro-Regular',
                              ),
                             ),
                         ],
                       ),
                     ),
                   ),
                    Container(
                     decoration: BoxDecoration(
                       color: Colors.black12,
                       borderRadius: BorderRadius.all(
                         Radius.circular(10),
                       ),
                     ),
                     margin: EdgeInsets.symmetric(
                       vertical: 15,
                       horizontal: 25,
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: <Widget>[
                           Icon(
                             Icons.email,
                             size: 25, 
                             color: Colors.black87,
                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                             Text('rahulramesh13.rr@gmail.com',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'SourceSansPro-Regular',
                              ),
                             ),
                         ],
                   ),
                     ),
                ),
              ],
        ),
            ),
          ),
    );
  }
}