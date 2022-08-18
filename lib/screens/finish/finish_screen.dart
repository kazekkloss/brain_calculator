import 'package:calculator/widgets/bottom_widget.dart';
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
        id: GUIDGen.generate(),
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
            body: GradientContainer(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height / 10),
                      child: Text(
                        'Your score:',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: height / 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 100),
                      child: Text(
                        score.toString(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    state.score >= 200
                        ? SizedBox(
                            height: height / 3.4,
                            width: height / 2,
                            child: const RiveAnimation.asset(
                              Assets.victoryCalc,
                              fit: BoxFit.contain,
                              alignment: Alignment(0, 1),
                            ),
                          )
                        : state.score == 0
                            ? SizedBox(
                                height: height / 3.4,
                                width: height / 2,
                                child: const RiveAnimation.asset(
                                  Assets.badCalc,
                                  fit: BoxFit.contain,
                                  alignment: Alignment(0, 1),
                                ),
                              )
                            : SizedBox(
                                height: height / 3.4,
                                width: height / 2,
                                child: const RiveAnimation.asset(
                                  Assets.okCalc,
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment(0.3, 1),
                                ),
                              ),
                    Text(
                      'On $level level',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: height / 30),
                    ),
                    const BottomWidget(oneButton: false)
                  ],
                ),
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
