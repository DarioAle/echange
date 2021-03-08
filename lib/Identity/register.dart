import 'package:echange/home/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _nameInputController = TextEditingController();
  var _emailInputController = TextEditingController();
  var _pswInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 0.9],
                colors: [Color.fromRGBO(129, 178, 154, 1.0), Colors.white12])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image(image: AssetImage('assets/images/plant.svg'))),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: _nameInputController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Nombre completo",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    controller: _emailInputController,
                    keyboardType: TextInputType.emailAddress,
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
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      elevation: 2,
                      color: Theme.of(context).buttonColor,
                      child: Text(
                        "REGISTRATE",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 10),
                child: Text(
                  "¿Ya tienes cuenta?",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "INGRESA",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
