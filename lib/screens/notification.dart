import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stat'),
      ),
      body: const Center(
        child: Text(
          'test3',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}