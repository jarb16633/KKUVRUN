import 'package:flutter/material.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      left: 5,
                      top: 3,
                      child: Container(
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('images/profile.png'),
                          radius: 30,
                        )
                      ),
                    ),
                    const Positioned(
                      top: 5,
                      child: Text(
                        "Run",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 350,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('images/testrun2.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
