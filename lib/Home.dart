import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Osembly'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}