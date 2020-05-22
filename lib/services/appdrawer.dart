import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:climate/screens/knowme.dart';
import 'package:climate/utilities/constants.dart';
import 'package:climate/screens/loadingscreen.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


class AppDrawer extends StatelessWidget {

  AppDrawer({@required this.imageKey});
  final AssetImage imageKey;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Container(
      child: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            DrawerHeader(
              child: null,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageKey,
                  fit: BoxFit.fitWidth,
                ),
                shape: BoxShape.rectangle
              ),
            ),
            ListTile(
              onTap: () => _goToNewScreen(context, LoadingScreen()),
              leading: Icon(
                OMIcons.home,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: miniTextStyle,
              ),
            ),
            ListTile(
              onTap: () => _goToNewScreen(context, KnowMe()),
              leading: Icon(
                OMIcons.work,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text(
                'About',
                style: miniTextStyle,
              ),
            ),
            ListTile(
              onTap: () => exit(0),
              leading: Icon(
                OMIcons.exitToApp,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text(
                'Exit',
                style: miniTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _goToNewScreen (BuildContext context, Widget nextPage) {
  Navigator.pop(context);
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> nextPage));
}
