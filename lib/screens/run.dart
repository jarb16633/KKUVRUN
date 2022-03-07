import 'package:flutter/material.dart';
import 'package:virtual_run_application/constants/constants.dart';

class RunPage extends StatelessWidget {
  static var screenHeight;
  static var screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: "",
      ),
    );
  }
}