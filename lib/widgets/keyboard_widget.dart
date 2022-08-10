import 'package:flutter/material.dart';

import 'package:calculator/blocs/blocs_export.dart';

import 'widgets.dart';

class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KeyboardWidget> createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 10, vertical: height / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonKeyboardWidget(
                    text: 'C',
                    isNumber: false,
                    onTap: () => context
                        .read<CalculationsBloc>()
                        .add(ClearNumberEvent()))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 10, vertical: height / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  text: '7',
                  isNumber: true,
                  onTap: () => _numberPressed(7),
                ),
                ButtonKeyboardWidget(
                  text: '8',
                  isNumber: true,
                  onTap: () => _numberPressed(8),
                ),
                ButtonKeyboardWidget(
                    text: '9', isNumber: true, onTap: () => _numberPressed(9))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 10, vertical: height / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  text: '4',
                  isNumber: true,
                  onTap: () => _numberPressed(4),
                ),
                ButtonKeyboardWidget(
                  text: '5',
                  isNumber: true,
                  onTap: () => _numberPressed(5),
                ),
                ButtonKeyboardWidget(
                  text: '6',
                  isNumber: true,
                  onTap: () => _numberPressed(6),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 10, vertical: height / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  text: '1',
                  isNumber: true,
                  onTap: () => _numberPressed(1),
                ),
                ButtonKeyboardWidget(
                  text: '2',
                  isNumber: true,
                  onTap: () => _numberPressed(2),
                ),
                ButtonKeyboardWidget(
                  text: '3',
                  isNumber: true,
                  onTap: () => _numberPressed(3),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 10, vertical: height / 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonKeyboardWidget(
                  text: '-',
                  isNumber: false,
                  onTap: () =>
                      context.read<CalculationsBloc>().add(NegativeInt()),
                ),
                ButtonKeyboardWidget(
                  text: '0',
                  isNumber: true,
                  onTap: () => _numberPressed(0),
                ),
                ButtonKeyboardWidget(
                    text: '=',
                    isNumber: false,
                    onTap: () {
                      {
                        print(state.levels);
                        state.levels == Levels.hard
                            ? context
                                .read<CalculationsBloc>()
                                .add(GetNumbersHardEvent())
                            : state.levels == Levels.medium
                                ? context
                                    .read<CalculationsBloc>()
                                    .add(GetNumbersMediumEvent())
                                : context
                                    .read<CalculationsBloc>()
                                    .add(GetNumbersEasyEvent());
                      }
                    }),
              ],
            ),
          ),
        ]);
      },
    );
  }

  void _numberPressed(number) {
    context.read<CalculationsBloc>().add(NumberPressed(number: number));
  }
}
