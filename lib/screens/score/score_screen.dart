import 'package:flutter/material.dart';

import 'package:calculator/blocs/blocs_export.dart';
import 'package:calculator/model/score_model.dart';

import '../../config/theme.dart';
import '../../widgets/widgets.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  static const String routeName = '/score';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const ScoreScreen());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (context, state) {
        List<Score> testList = state.scoreList;
        return Scaffold(
          body: GradientContainer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Score',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: height / 17),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: testList.length,
                        itemBuilder: (context, index) {
                          var number = index + 1;
                          var score = testList[index];
                          return ScoreTile(
                            number: number,
                            score: score,
                            height: height,
                            width: width,
                          );
                        }),
                  ),
                  const BottomWidget(
                    oneButton: true,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
