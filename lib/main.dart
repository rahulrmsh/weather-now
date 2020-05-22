import 'package:flutter/material.dart';
import 'screens/loadingscreen.dart';

void main() => runApp(Climate());

class Climate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoadingScreen(),
    );
  }
}