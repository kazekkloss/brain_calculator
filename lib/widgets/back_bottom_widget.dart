import 'package:flutter/material.dart';

class BackBottomWidget extends StatelessWidget {
  const BackBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(77, 0, 255, 247),
      child: SizedBox(
        height: height / 8,
        width: width,
        child: Center(
            child: TextButton(
          child: Text(
            'back',
          ),
          onPressed: () async {
            await Navigator.pushNamed(context, '/home');
          },
        )),
      ),
    );
  }
}
