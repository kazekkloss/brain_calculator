import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ButtonKeyboardWidget extends StatefulWidget {
  final Icon? icon;
  final bool? isNumber;
  final bool? navigate;
  final String? text;
  final VoidCallback onTap;
  const ButtonKeyboardWidget({
    this.icon,
    this.navigate = false,
    this.text,
    this.isNumber = true,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonKeyboardWidget> createState() => _ButtonKeyboardWidgetState();
}

class _ButtonKeyboardWidgetState extends State<ButtonKeyboardWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    Color backgroundColor = widget.isNumber!
        ? const Color.fromARGB(255, 0, 126, 146)
        : widget.navigate! ? const Color.fromARGB(255, 0, 144, 19) : const Color.fromARGB(255, 0, 93, 12);
    Offset distance = isPressed ? const Offset(1, 1) : const Offset(5, 5);
    double blur = isPressed ? 3.0 : 13.0;
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
                  color: const Color.fromARGB(60, 0, 0, 0),
                  inset: isPressed,
                ),
                BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: const Color.fromARGB(60, 0, 0, 0),
                  inset: isPressed,
                )
              ]),
          child: SizedBox(
              height: height / 10,
              width: height / 10,
              child: Center(
                child: widget.navigate!
                    ? widget.icon : Text(
                        widget.text!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: isPressed ? height / 23 : height / 20,
                            color: widget.isNumber!
                                ? const Color.fromARGB(255, 0, 221, 255)
                                : const Color.fromARGB(255, 0, 255, 34)),
                      )
              )),
        ));
  }
}
