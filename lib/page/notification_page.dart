import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'acc_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 22),
            SizedBox(
              height: 486,
              child: ListView(
                padding: EdgeInsets.only(left: 10),
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AccPage();
                          }));
                        },
                        child: Container(
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('images/LoginPage_KKUVRUN.png'),
                            radius: 30,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              '     INDEX',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 43),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 200),
                  Center(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '      No Messages Yet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '         Message and notification will shown up here')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
