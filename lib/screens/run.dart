import 'package:flutter/material.dart';
import 'package:virtual_run_application/constants/constants.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: appPadding, right: appPadding  / 2, top: appPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(appPadding / 8),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/profile.jpeg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 120,),
              const Text("Run",
                style: TextStyle(
                    fontFamily: "WorkSans",
                    fontSize: 30,
                    fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}