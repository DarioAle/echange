import 'package:auth_buttons/auth_buttons.dart';
import 'package:echange/Identity/register.dart';
import 'package:echange/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:echange/bloc/auth_bloc.dart';

import 'bloc/login_bloc.dart';

class LogInForm extends StatefulWidget {
  LogInForm({Key key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  LoginBloc _loginBloc;
  bool _showLoading = false;

  void _anonymousLogIn(bool _) {
    print("anonimo");
    _loginBloc.add(LoginAnonymousEvent());
  }

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
    _loginBloc.add(LoginWithGoogleEvent());
  }

  var _emailInputController = TextEditingController();
  var _pswInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.white, fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Inicia sesión",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 20),
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
          SafeArea(
              child: BlocProvider(
            create: (context) {
              _loginBloc = LoginBloc();
              return _loginBloc;
            },
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginErrorState) {
                  _showLoading = false;
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text("${state.error}"),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    },
                  );
                } else if (state is LoginLoadingState) {
                  _showLoading = !_showLoading;
                } else if (state is LoginSuccessState) {
                  BlocProvider.of<AuthBloc>(context)
                      .add(VerifyAuthenticationEvent());
                }
              },
              builder: (context, state) {
                return (Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        elevation: 2,
                        color: Color.fromRGBO(61, 64, 91, 1),
                        child: Text(
                          "Ingresa anonimamente",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          _loginBloc.add(LoginAnonymousEvent());
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: GoogleAuthButton(
                          // borderRadius: 10.0,
                          text: "Ingresa con Google",
                          darkMode: true,
                          // buttonColor: Color.fromRGBO(61, 64, 91, 1),
                          onPressed: () {
                            Future.delayed(Duration(milliseconds: 10),
                                () => _loginBloc.add(LoginWithGoogleEvent()));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home()));
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10),
                      child: Text(
                        "¿Aún no tienes cuenta?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register())),
                      child: Text(
                        "REGISTRATE",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ));
              },
            ),
          ))
        ]),
      ),
    );
  }
}
