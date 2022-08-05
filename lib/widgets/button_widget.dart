import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ButtonWidget extends StatefulWidget {
  final bool isNumber;
  final String text;
  final VoidCallback onTap;
  const ButtonWidget({
    required this.text,
    required this.isNumber,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.isNumber
        ? const Color.fromARGB(255, 130, 209, 255)
        : const Color.fromARGB(255, 136, 0, 255);
    Offset distance = isPressed ? const Offset(1, 1) : const Offset(5, 5);
    double blur = isPressed ? 3.0 : 13.0;
    TextStyle size = isPressed
        ? const TextStyle(fontSize: 22)
        : const TextStyle(fontSize: 25);
    return GestureDetector(
        onTap: widget.onTap,
        onTapDown: (value) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (value) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: const Color.fromARGB(255, 0, 57, 103),
                    inset: isPressed,
                  ),
                  BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: const Color.fromARGB(255, 0, 57, 103),
                    inset: isPressed,
                  )
                ]),
            child: SizedBox(
              height: 70,
              width: 70,
              child: Center(
                  child: Text(
                widget.text,
                style: size.copyWith(
                    color: widget.isNumber
                        ? const Color.fromARGB(255, 0, 127, 230)
                        : const Color.fromARGB(255, 255, 255, 255)),
              )),
            )));
  }
}