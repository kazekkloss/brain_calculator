import 'package:calculator/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/async.dart';

import '../blocs/player/player_bloc.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  static const String routeName = '/test';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const TestingScreen());
  }

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final PlayerModel player = state.player;
        return Scaffold(
          body: Center(
              child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text('Create your name'),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: () {
                    nameController.text.isEmpty
                        ? print('empty')
                        : context
                            .read<PlayerBloc>()
                            .add(AddPlayer(name: nameController.text));
                  },
                  child: Text('Ok')),
              SizedBox(
                height: 50,
              ),
              player.name.isEmpty ? Text('') : Text(player.name),
              SizedBox(
                height: 50,
              ),
            ],
          )),
        );
      },
    );
  }
}
