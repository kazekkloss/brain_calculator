import 'package:flutter/material.dart';

class ButtonBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final String text;
  const ButtonBottom({
    Key? key,
    required this.onPressed,
    required this.height,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(180, 255, 255, 255),
            borderRadius: BorderRadius.circular(height / 30),
            border: Border.all(
                style: BorderStyle.solid,
                width: 4,
                color: const Color.fromARGB(255, 14, 163, 0)),
          ),
          child: SizedBox(
            height: height / 14,
            width: height / 8,
            child: Center(
                child: Text(
              text,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: height / 45,
                  color: const Color.fromARGB(255, 14, 163, 0)),
            )),
          )),
      onPressed: onPressed,
    );
  }
}
