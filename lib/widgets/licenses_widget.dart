import 'package:flutter/material.dart';

class LicensesWidget extends StatelessWidget {
  const LicensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LicensePage(
        applicationName: 'Brain calculator',
        applicationVersion: '0.0.1',
        applicationLegalese:
            'Copyright ${DateTime.now().year} Kazimierz Radzik',
      );
}
