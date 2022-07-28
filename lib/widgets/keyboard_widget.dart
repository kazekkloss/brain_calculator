import 'package:flutter/material.dart';

import 'widgets.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(text: '7', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '8', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '9', isNumber: true, numberPressed: () {})
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(text: '4', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '5', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '6', isNumber: true, numberPressed: () {})
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(text: '1', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '2', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '3', isNumber: true, numberPressed: () {}),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(text: 'C', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '0', isNumber: true, numberPressed: () {}),
            ButtonWidget(text: '=', isNumber: true, numberPressed: () {}),
          ],
        ),
      ),
    ]);
  }
}