import 'package:flutter/material.dart';

class TickerWidget extends StatelessWidget {
  final double height;
  final int _current;
  const TickerWidget({
    Key? key,
    required this.height,
    required int current,
  })  : _current = current,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 7,
      width: height / 7,
      decoration: BoxDecoration(
        border: Border.all(
            width: height / 100,
            color: const Color.fromARGB(255, 255, 255, 255)),
        color: const Color.fromARGB(255, 0, 129, 97),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$_current',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: const Color.fromARGB(255, 0, 225, 255), fontSize: height / 13),
        ),
      ),
    );
  }
}