String stFul = '''
import 'package:flutter/material.dart';

class {{WidgetName}} extends StatefulWidget {
  const {{WidgetName}}({Key? key}) : super(key: key);

  @override
  _{{WidgetName}}State createState() => _{{WidgetName}}State();
}

class _{{WidgetName}}State extends State<{{WidgetName}}> {
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
      ),
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
