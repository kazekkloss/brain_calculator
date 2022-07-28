import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class ButtonWidget extends StatefulWidget {
  final bool isNumber;
  final String text;
  final VoidCallback numberPressed;
  const ButtonWidget({
    required this.text,
    required this.isNumber,
    required this.numberPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromARGB(255, 130, 209, 255);
    Offset distance = isPressed ? const Offset(1, 1) : const Offset(5, 5);
    double blur = isPressed ? 3.0 : 13.0;
    TextStyle size =
        isPressed ? const TextStyle(fontSize: 25) : const TextStyle(fontSize: 30);
    return GestureDetector(
      onPanStart: (value) {
        widget.numberPressed;
        setState(() {
          isPressed = !isPressed;
        });
      },
      onPanEnd: (value) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 200),
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
          height: 75,
          width: 75,
          child: Center(
              child: Text(
            widget.text,
            style: size.copyWith(color: const Color.fromARGB(255, 0, 127, 230)),
          )),
        ),
      ),
    );
  }
}

// class ButtonWidget extends StatefulWidget {
//   final bool isNumber;
//   final String text;
//   final VoidCallback numberPressed;
//   const ButtonWidget({
//     required this.text,
//     required this.isNumber,
//     required this.numberPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ButtonWidget> createState() => _ButtonWidgetState();
// }

// class _ButtonWidgetState extends State<ButtonWidget> {
//   bool isPressed = true;
//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       width: 75,
//       height: 75,
//       decoration: const BoxDecoration(
//         color: Color.fromARGB(255, 0, 153, 176),
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             inset: true,
//             color: Color.fromARGB(112, 0, 0, 0),
//             offset: Offset(3, 3),
//             blurRadius: 6.0,
//           ),
//           BoxShadow(
//               inset: true,
//               color: Color.fromARGB(188, 255, 255, 255),
//               offset: Offset(-3, -3),
//               blurRadius: 6.0),
//         ],
//       ),
//       child: InkWell(
//         onTap: () {
//           widget.numberPressed();
//         },
//         customBorder: const CircleBorder(),
//         child: Center(
//           child: Text(
//             widget.text,
//             style: const TextStyle(color: Colors.white, fontSize: 30),
//           ),
//         ),
//         splashColor: Color.fromARGB(255, 0, 113, 130),
//       ),
//     );
//   }
// }
