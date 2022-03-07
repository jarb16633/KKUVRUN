import 'package:flutter/material.dart';
import 'package:virtual_run_application/constants/constants.dart';

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
                          backgroundImage: AssetImage('images/Pro_Trong.jpg'),
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
                      image: AssetImage('images/map.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5)),
                      backgroundColor: MaterialStateProperty.all<Color>(primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.black12)
                        )
                      )
                    ),
                  onPressed: () {},
                  child: const Text(
                      "Start",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3,),
              Center(child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 2)),
                    foregroundColor: MaterialStateProperty.all<Color>(black),
                    backgroundColor: MaterialStateProperty.all<Color>(white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black12)
                        )
                    )
                ),
                onPressed: () {},
                child: const Text(
                  "Set goal",
                  style: TextStyle(
                      fontSize: 12
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
