import 'package:echange/Identity/log_in_page.dart';
import 'package:echange/Identity/register.dart';
import 'package:flutter/material.dart';

class Identity extends StatefulWidget {
  Identity({Key key}) : super(key: key);

  @override
  _IdentityState createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(129, 178, 154, 1.0),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image(
                    image: AssetImage('assets/images/plant.png'),
                    height: 200,
                  )),
              Text("E-change!",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white, fontSize: 50)),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      elevation: 2,
                      color: Color.fromRGBO(61, 64, 91, 1),
                      child: Text(
                        "Registrate",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                    ),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      elevation: 2,
                      color: Color.fromRGBO(61, 64, 91, 1),
                      child: Text("Ingresa",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInPage()));
                      },
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
