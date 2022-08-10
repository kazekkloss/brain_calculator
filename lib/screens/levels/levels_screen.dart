import 'package:flutter/material.dart';

import '../../blocs/blocs_export.dart';
import '../../config/theme.dart';
import '../../widgets/back_bottom_widget.dart';

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
      body: CustomTheme().gradientContainer(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 9, bottom: height / 35),
                    child: Text(
                      'Levels',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: height / 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 50,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 255, 255),
                            borderRadius: BorderRadius.circular(height / 40)),
                        child: SizedBox(
                          height: height / 7,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('EASY'),
                              ),
                              Text(
                                '43 - 23\npoziom dla bobasów i karyn',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 50,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 255, 255),
                            borderRadius: BorderRadius.circular(height / 40)),
                        child: SizedBox(
                          height: height / 7,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('MEDIUM'),
                              ),
                              Text(
                                '4 x 14 + 54\ncoś dla normanych ludzi',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 50,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 255, 255),
                            borderRadius: BorderRadius.circular(height / 40)),
                        child: SizedBox(
                          height: height / 7,
                          width: width / 1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('HARD'),
                              ),
                              Text(
                                '15 - 13 x 54\ntylko dla azjatów',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  //ElevatedButton(
                  //    onPressed: () {
                  //      Navigator.pushNamed(context, '/counting_down',
                  //          arguments: Levels.hard);
                  //    },
                  //    child: const Text('Hard')),
                ],
              ),
              const BackBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
