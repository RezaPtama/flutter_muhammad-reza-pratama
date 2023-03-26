import 'package:flutter/cupertino.dart';

class Ios extends StatelessWidget {
  const Ios({super.key});
    final _themeDark = const CupertinoThemeData.raw(
    Brightness.dark,
    null,
    null,
    null,
    null,
    null,
    );

  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      theme: _themeDark,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino App'),
        ),child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This Is CupertinoApp')
              ],
            ),
          ),
        ),
      )
    );
  }
}