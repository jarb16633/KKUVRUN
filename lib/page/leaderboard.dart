import 'package:flutter/material.dart';
import 'package:strava/pages/maps.dart';
import 'package:strava/model/entry.dart';
import 'runpage.dart';
import 'acc_page.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              extendedSizeConstraints:
                  BoxConstraints.tightFor(height: 55, width: 250)),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xFFA73B24),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MapPage()));
          },
          label: Text('Go For Run'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 400,
                  height: 70,
                  //color: Colors.grey,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        left: 5,
                        top: 3,
                        child: GestureDetector(
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
                      ),
                      const Positioned(
                        top: 5,
                        child: Text(
                          'Activity',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Text(
                      'Total Distance',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Text(
                      '0.0 km',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  const EventItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.redAccent,
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text('test'),
              ],
            ),
          )),
    );
  }
}
