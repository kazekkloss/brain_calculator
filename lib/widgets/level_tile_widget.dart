import 'package:flutter/material.dart';

class LevelTile extends StatelessWidget {
  final String title;
  final String math;
  final String description;
  final double height;
  final double width;
  const LevelTile({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.math,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height / 50,
      ),
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(86, 255, 255, 255),
              borderRadius: BorderRadius.circular(height / 40),),
          child: SizedBox(
            height: height / 7,
            width: width / 1.5,
            child: Padding(
              padding: EdgeInsets.only(top: height / 66, bottom: height / 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: height/45, color: Colors.white)),
                  Text(math, style: Theme.of(context).textTheme.subtitle2!),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyText1!)
                ],
              ),
            ),
          )),
    );
  }
}
