import 'package:calculator/blocs/calc/calc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                    text: 'C',
                    isNumber: false,
                    onTap: () => context
                        .read<CalculationsBloc>()
                        .add(ClearNumberEvent()))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: '7',
                  isNumber: true,
                  onTap: () => _numberPressed(7),
                ),
                ButtonWidget(
                  text: '8',
                  isNumber: true,
                  onTap: () => _numberPressed(8),
                ),
                ButtonWidget(
                    text: '9', isNumber: true, onTap: () => _numberPressed(9))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: '4',
                  isNumber: true,
                  onTap: () => _numberPressed(4),
                ),
                ButtonWidget(
                  text: '5',
                  isNumber: true,
                  onTap: () => _numberPressed(5),
                ),
                ButtonWidget(
                  text: '6',
                  isNumber: true,
                  onTap: () => _numberPressed(6),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: '1',
                  isNumber: true,
                  onTap: () => _numberPressed(1),
                ),
                ButtonWidget(
                  text: '2',
                  isNumber: true,
                  onTap: () => _numberPressed(2),
                ),
                ButtonWidget(
                  text: '3',
                  isNumber: true,
                  onTap: () => _numberPressed(3),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: '-',
                  isNumber: false,
                  onTap: () =>
                      context.read<CalculationsBloc>().add(NegativeInt()),
                ),
                ButtonWidget(
                  text: '0',
                  isNumber: true,
                  onTap: () => _numberPressed(0),
                ),
                ButtonWidget(
                    text: '=',
                    isNumber: false,
                    onTap: () {
                      {
                        state.numberFour == null
                            ? state.numberThree == null
                                ? context
                                    .read<CalculationsBloc>()
                                    .add(GetNumbersEasyEvent())
                                : context
                                    .read<CalculationsBloc>()
                                    .add(GetNumbersMediumEvent())
                            : context
                                .read<CalculationsBloc>()
                                .add(GetNumbersHardEvent());
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
