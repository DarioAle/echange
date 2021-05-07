import 'package:echange/Identity/register.dart';
import 'package:echange/bloc/auth_bloc.dart';
import 'package:echange/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Identity/identity.dart';
import 'utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText1: TextStyle(fontFamily: "Titillium Web Regular"),
              headline1: TextStyle(fontFamily: "Titillium Web Semibold"))),
      // DEV-only
      // home: Home(),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AlreadyAuthState) return Home();
          if (state is UnAuthState) return Identity();
          return SplashScreen(
            loaderColor: Color.fromRGBO(224, 122, 95, 1),
            loadingText: Text(
              "Cargando...",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
            seconds: 5,
            title: Text(
              "E-change!",
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w600),
            ),
            image: Image(
              image: AssetImage('assets/images/plant.png'),
              height: 200,
            ),
            navigateAfterSeconds: Identity(),
            photoSize: 200,
            backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
          );
        },
      ),
    );
  }
}
