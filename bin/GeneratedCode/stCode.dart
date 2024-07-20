const String st = '''
import 'package:flutter/material.dart';

class {{WidgetName}} extends StatelessWidget {
  const {{WidgetName}}({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text(
            "AppBar",
            textAlign: TextAlign.start,
          ),
        ),
        body: const Center(
          child: Text(
            "Stateless Widget",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
''';
