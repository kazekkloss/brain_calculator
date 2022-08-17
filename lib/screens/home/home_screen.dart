import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: GradientContainer(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: height / 14,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Home',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: height / 17)),
              Padding(
                padding: EdgeInsets.only(top: height / 13),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 30),
                        child: ButtonHome(
                            navigate: () async {
                              await Navigator.pushNamed(context, '/levels');
                            },
                            text: 'Start')),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 30),
                      child: ButtonHome(
                          navigate: () async {
                            await Navigator.pushNamed(context, '/score');
                          },
                          text: 'Score'),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: height / 30),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LicensesWidget())),
                          child: Text(
                            'Licenses',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: height / 43, color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 4.5,
          width: height,
          child: const RiveAnimation.asset(
            Assets.homeCalc,
            alignment: Alignment.bottomLeft,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    )));
  }
}
