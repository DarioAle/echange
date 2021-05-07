import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchNotification extends StatefulWidget {
  final String name;
  final String number;
  MatchNotification({Key key, this.name, this.number}) : super(key: key);

  @override
  _MatchNotificationState createState() => _MatchNotificationState();
}

class _MatchNotificationState extends State<MatchNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      color: Color.fromRGBO(48, 64, 56, .6),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          Text("E-Change!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white,
                    fontSize: 45,
                  )),
          SizedBox(
            height: 20,
          ),
          Text(
            "¡${this.widget.name} y tu podrán intercambiar artículos pronto!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Pro tip: Puedes empezar la conversación especificando tu zona o qué días podrías realizar el intercambio",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(95, 114, 211, .9),
                  child: Image.asset("assets/images/woman2.png"),
                  minRadius: 40,
                  maxRadius: 60,
                ),
              ),
              Image.asset(
                "assets/images/plant.png",
                height: 30,
              ),
              Container(
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(203, 104, 238, .9),
                  child: Image.asset("assets/images/woman.png"),
                  minRadius: 40,
                  maxRadius: 60,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            color: Color.fromRGBO(61, 64, 91, 1),
            minWidth: 200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: _launchURL,
            child: Text(
              "Hablar con ella",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    // TODO: add correct number from user
    final String url = "https://wa.me/52${this.widget.number}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
