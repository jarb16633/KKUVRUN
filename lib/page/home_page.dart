import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/profile.dart';
import 'acc_page.dart';
import 'package:strava/widgets/entry_card.dart';
import 'package:provider/provider.dart';
import 'package:strava/model/entry.dart';

class HomePageE extends StatelessWidget {
  HomePageE({Key? key}) : super(key: key);
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  String? textNote;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  late List<Entry> data;
  List<EntryCard> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
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
                          'Feed',
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
                    ListTile(
                      title: Text('What\'s New'),
                      subtitle: Text('Check out the latest from KKU VRUN'),
                    ),
                    EventItem(),
                    EventItem(),
                    EventItem(),
                    EventItem(),
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
            image: const DecorationImage(
              colorFilter: ColorFilter.matrix([
                1,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                0,
                0.5,
                0,
              ]),
              image: AssetImage('images/testrun2.png'),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const <Widget>[
                Text('Challenge Name',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Spacer(),
                Text(
                  'Distance: 15 km',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Time: 3 Day',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          )),
    );
  }
}
