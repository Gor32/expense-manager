import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

import 'resources/strings.dart';

void main() => runApp(StartUp());

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.app_title,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomeScreen()
    );
  }
}
