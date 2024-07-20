String stFul = '''
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.green,
        title: const Text(
          "GeeksforGeeks",
          textAlign: TextAlign.start,
        ),
      ), // AppBar
      body: const Center(
        child: Text(
          "StateFul Widget",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }
}

''';
