import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final VoidCallback navigate;
  final String text;
  const ButtonHome({Key? key, required this.navigate, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return TextButton(
        onPressed: navigate,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(86, 255, 255, 255),
              border: Border.all(
                  style: BorderStyle.solid,
                  width: 2,
                  color: const Color.fromARGB(255, 19, 227, 0)),
              borderRadius: BorderRadius.circular(height / 40)),
          child: SizedBox(
            height: height / 14,
            width: height / 6,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: height / 40),
              ),
            ),
          ),
        ));
  }
}
