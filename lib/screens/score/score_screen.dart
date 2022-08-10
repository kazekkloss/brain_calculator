import 'package:flutter/material.dart';

import 'package:calculator/blocs/blocs_export.dart';
import 'package:calculator/model/score_model.dart';
import 'package:intl/intl.dart';

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
    return BlocBuilder<ScoreBloc, ScoreState>(
      builder: (context, state) {
        List<Score> testList = state.scoreList;
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text('Score'),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: testList.length,
                      itemBuilder: (context, index) {
                        var number = index + 1;
                        var task = testList[index];
                        return Container(
                          color: Colors.amber,
                          child: SizedBox(
                              child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(number.toString()),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(DateFormat()
                                .add_yMd()
                                .add_Hm()
                                .format(DateTime.parse(task.date))),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(task.points.toString()),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(task.level),
                          ])),
                        );
                      }),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              child: TextButton(
            child: const Text('BACK'),
            onPressed: () async {
              await Navigator.pushNamed(context, '/home');
            },
          )),
        );
      },
    );
  }
}
