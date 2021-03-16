import 'package:flutter/material.dart';
import 'Identity/identity.dart';
import 'home/home.dart';
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
      home: Home(),
      // home: new SplashScreen(
      //   seconds: 5,
      //   title: Text(
      //     "E-change!",
      //     style: TextStyle(color: Colors.white, fontSize: 50),
      //   ),
      //   image: Image(
      //     image: AssetImage('assets/images/plant.png'),
      //     height: 200,
      //   ),
      //   navigateAfterSeconds: Identity(),
      //   photoSize: 200,
      //   backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
      // )
    );
  }
}
