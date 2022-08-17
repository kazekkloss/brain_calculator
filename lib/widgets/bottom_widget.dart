// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/blocs/blocs_export.dart';
import 'package:flutter/material.dart';

import 'buttons/button_bottom.dart';

class BottomWidget extends StatelessWidget {
  final bool oneButton;
  const BottomWidget({
    Key? key,
    required this.oneButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(77, 255, 255, 255),
          border: Border(
              top: BorderSide(
                  width: 2, color: Color.fromARGB(255, 14, 163, 0)))),
      child: SizedBox(
        height: height / 8,
        width: width,
        child: oneButton
            ? ButtonBottom(
                text: 'Back',
                height: height,
                onPressed: () => Navigator.pushNamed(context, '/home'),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonBottom(
                    text: 'Menu',
                    height: height,
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                  ButtonBottom(
                      text: 'Resume',
                      height: height,
                      onPressed: () {
                        final CalculationsBloc calcBloc =
                            BlocProvider.of<CalculationsBloc>(context);
                        var levels = calcBloc.state.levels;
                        Navigator.pushNamed(context, '/counting_down',
                            arguments: levels);
                      })
                ],
              ),
      ),
    );
  }
}
