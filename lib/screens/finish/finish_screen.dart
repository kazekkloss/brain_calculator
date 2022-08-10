import 'package:flutter/material.dart';

import 'package:calculator/blocs/blocs_export.dart';
import 'package:calculator/model/score_model.dart';
import 'package:calculator/config/config.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/finish';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: ((context) => const FinishScreen()));
  }

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  @override
  void initState() {
    final CalculationsBloc calcBloc =
        BlocProvider.of<CalculationsBloc>(context);
    String level;
    calcBloc.state.levels == Levels.easy
        ? level = 'easy'
        : calcBloc.state.levels == Levels.medium
            ? level = 'medium'
            : level = 'hard';
    var score = Score(
        date: DateTime.now().toString(),
        level: level,
        points: calcBloc.state.score);
    if (calcBloc.state.score > 0) {
      context.read<ScoreBloc>().add(AddScore(score: score));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        final score = state.score;
        String level;
        state.levels == Levels.easy
            ? level = 'easy'
            : state.levels == Levels.medium
                ? level = 'medium'
                : level = 'hard';
        return WillPopScope(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height / 10),
                    child: Text('Your score: $score'),
                  ),
                  state.score == 0
                      ? SizedBox(
                          height: height / 2,
                          width: height / 2,
                          child: const RiveAnimation.asset(
                            Assets.badCalc,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(
                          height: height / 2,
                        ),
                  Padding(
                    padding: EdgeInsets.all(height / 20),
                    child: Text('on $level level'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: const Text('Back to menu')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/counting_down',
                                arguments: state.levels);
                          },
                          child: const Text('Resume'))
                    ],
                  )
                ],
              ),
            ),
          ),
          onWillPop: () async {
            return false;
          },
        );
      },
    );
  }
}
