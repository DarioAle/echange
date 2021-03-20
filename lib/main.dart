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
          image: new Image.asset('assets/images/plant.png'),
          photoSize: 200,
          backgroundColor : Color(0xFF81B29A)
        )
    );
  }
}
