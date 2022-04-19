import 'package:flutter/material.dart';
import 'package:strava/pages/home.dart';
import 'page/sec_home-page.dart';
import 'package:strava/pages/testmap.dart';
import 'package:strava/page/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: SecLogin(),
    );
  }
}
