import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 0, 152, 117),
        child: Center(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text('MENU'),
            )
          ],
        )),
      ),
    );
  }
}
