import 'package:flutter/material.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          'test1',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}