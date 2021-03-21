import 'package:echange/home/home.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _nameInputController = TextEditingController();
  var _lastNameInputController = TextEditingController();
  var _emailInputController = TextEditingController();
  var _pswInputController = TextEditingController();
  var _verifyPswInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(129, 178, 154, 1.0),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
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
                    "Registrate",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: TextField(
                    controller: _nameInputController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Nombre",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                    controller: _lastNameInputController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Apellidos",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                    controller: _emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                    obscureText: true,
                    controller: _pswInputController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey)),
                      labelText: "Contraseña",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                    obscureText: true,
                    controller: _verifyPswInputController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Verifica contraseña",
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
                    "Registrate",
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
                    text: "Registrate con Facebook",
                    darkMode: true,
                    buttonColor: Color.fromRGBO(61, 64, 91, 1),
                    onPressed: () {},
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: GoogleAuthButton(
                    borderRadius: 10.0,
                    text: "Registrate con Google",
                    darkMode: true,
                    buttonColor: Color.fromRGBO(61, 64, 91, 1),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}