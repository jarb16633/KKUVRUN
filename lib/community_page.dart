import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
                      CircleAvatar(
                        backgroundImage: AssetImage('images/tom.jpg'),
                        radius: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            ' COMMUNITY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 43),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Challenge',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN8Nxub0v3pIRqHcA4IYaC-up5s2mKRi4sIQ&usqp=CAU',
                  ),
                  Divider(),
                  Text(
                    "John Challenge",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/golf.jpg'),
                        radius: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'Weekly challenge for march',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('            Run for 21 kilometers in this week')
                        ],
                      ),
                    ],
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
