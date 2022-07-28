import 'package:calculator/blocs/calc/calc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        int jeden = state.firstOperand;
        String operator = state.firstOperator;
        int drugi = state.secondOperand;
        int result = state.result;
        int score = state.score;
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Text('Score: $score'),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: jeden == 00
                      ? const Text('')
                      : result == 00
                          ? Text('$jeden ' '$operator ' '$drugi = ' '?')
                          : Text('$jeden ' '$operator ' '$drugi = ' '$result')),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _numberbutton(text: '7', onTap: () => numberPressed(7)),
                    _numberbutton(text: '8', onTap: () => numberPressed(8)),
                    _numberbutton(text: '9', onTap: () => numberPressed(9)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _numberbutton(text: '4', onTap: () => numberPressed(4)),
                    _numberbutton(text: '5', onTap: () => numberPressed(5)),
                    _numberbutton(text: '6', onTap: () => numberPressed(6)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _numberbutton(text: '1', onTap: () => numberPressed(1)),
                    _numberbutton(text: '2', onTap: () => numberPressed(2)),
                    _numberbutton(text: '3', onTap: () => numberPressed(3)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _numberbutton(text: '0', onTap: () => numberPressed(0)),
                    _numberbutton(
                        text: '-',
                        onTap: () => context
                            .read<CalculationsBloc>()
                            .add(NegativeInt())),
                    _numberbutton(
                        text: '=',
                        onTap: () {
                          context
                              .read<CalculationsBloc>()
                              .add(CalculationsResult());
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _numberbutton({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(text),
    );
  }

  void numberPressed(number) {
    context.read<CalculationsBloc>().add(NumberPressed(number: number));
  }
}
