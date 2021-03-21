import 'package:flutter/material.dart';

class MatchNotification extends StatefulWidget {
  MatchNotification({Key key}) : super(key: key);

  @override
  _MatchNotificationState createState() => _MatchNotificationState();
}

class _MatchNotificationState extends State<MatchNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Text("E-Change!",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                  )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Andrea y tu podrán intercambiar artículos pronto",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Pro tip: Puedes empezar la conversación especificando tu zona o qué días podrías realizar el intercambio",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
