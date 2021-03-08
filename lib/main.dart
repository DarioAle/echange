import 'package:flutter/material.dart';
import 'Identity/identity.dart';
import 'utils/constants.dart';

import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_TITLE,
        theme: ThemeData(
          primarySwatch: PRIMARY_COLOR,
          buttonColor: BUTTON_COLOR,
          cardColor: SECONDARY_COLOR,
          selectedRowColor: THIRD_COLOR,
        ),
        // home: Home(title: APP_TITLE),
        home: new SplashScreen(
          seconds: 2,
          navigateAfterSeconds: Identity(),
          photoSize: 200,
          gradientBackground: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 0.9],
              colors: [Color.fromRGBO(129, 178, 154, 1.0), Colors.white12]),
        ));
  }
}
