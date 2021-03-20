import 'package:auth_buttons/auth_buttons.dart';
import 'package:echange/home/home.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var _emailInputController = TextEditingController();
  var _pswInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(129, 178, 154, 1.0),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Image(
              image: AssetImage('assets/images/plant.png'),
              height: 100,
            ),
            Text(
              "E-change!",
              style: TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Inicia sesión",
                  style: TextStyle(fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: _emailInputController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  obscureText: true,
                  controller: _pswInputController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                elevation: 2,
                color: Color.fromRGBO(61, 64, 91, 1),
                child: Text(
                  "Ingresa",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: FacebookAuthButton(
                  borderRadius: 10.0,
                  text: "Ingresa con Facebook",
                  darkMode: true,
                  buttonColor: Color.fromRGBO(61, 64, 91, 1),
                  onPressed: () {},
                )),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: GoogleAuthButton(
                  borderRadius: 10.0,
                  text: "Ingresa con Google",
                  darkMode: true,
                  buttonColor: Color.fromRGBO(61, 64, 91, 1),
                  onPressed: () {},
                )),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                "¿Aún no tienes cuenta?",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "REGISTRATE",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
