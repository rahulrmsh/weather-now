import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);  
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/flatillustraionerror.jpg'),
                    ),
                   Text(
                     'ERROR',
                     style: TextStyle(color: Colors.black54, fontFamily: 'AUBREY1', fontSize: 45.0, fontWeight: FontWeight.w400,),
                   ),
                   Text(
                     'Go Back and Try Again',
                     style: TextStyle( color: Colors.black45, fontSize: 28.0, fontFamily: 'AUBREY1', fontWeight: FontWeight.w200),
                   )
              ],
        ),
            ),
          ),
    );
  }
}