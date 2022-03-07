import 'package:flutter/material.dart';
import 'package:virtual_run_application/screens/activity.dart';
import 'package:virtual_run_application/screens/community.dart';
import 'package:virtual_run_application/screens/home.dart';
import 'package:virtual_run_application/screens/notification.dart';
import 'package:virtual_run_application/screens/run.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WorkSans',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const ActivityPage(),
    const RunPage(),
    const CommunityPage(),
    const NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        iconSize: 25,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run_outlined),
            label: 'Run',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outlined),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
