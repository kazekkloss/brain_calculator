import 'package:flutter/material.dart';

import '../../blocs/blocs_export.dart';
import '../../config/theme.dart';
import '../../widgets/widgets.dart';


class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  static const String routeName = '/levels';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const LevelsScreen());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GradientContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 14, bottom: height / 35),
                    child: Text(
                      'Levels',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: height / 17),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/counting_down',
                          arguments: Levels.easy);
                    },
                    child: LevelTile(
                      height: height,
                      width: width,
                      title: 'Easy',
                      math: '43 - 23',
                      description: 'To warm up',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/counting_down',
                          arguments: Levels.medium);
                    },
                    child: LevelTile(
                      height: height,
                      width: width,
                      title: 'Medium',
                      math: '4 x 14 + 54',
                      description: 'To think hard',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/counting_down',
                          arguments: Levels.hard);
                    },
                    child: LevelTile(
                      height: height,
                      width: width,
                      title: 'Hard',
                      math: '15 - 13 x 54',
                      description: 'To have a headache',
                    ),
                  ),
                ],
              ),
              const BottomWidget(
                oneButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
