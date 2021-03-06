import 'package:flutter/material.dart';

import 'match_notification.dart';

class MatchesItem extends StatefulWidget {
  MatchesItem({Key key}) : super(key: key);

  @override
  _MatchesItemState createState() => _MatchesItemState();
}

class _MatchesItemState extends State<MatchesItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(242, 204, 143, 1.0),
            border:
                Border.all(color: Color.fromRGBO(61, 64, 91, 1.0), width: 0.5)),
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: [
              Align(
                  alignment: Alignment(-0.12, -1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Andrea Salazar",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Blusa Mediana",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            "Color verde",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ]),
                  )),
              Align(
                  alignment: Alignment(-1.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      height: 85,
                      width: 85,
                    ),
                  ))
            ]),
          ),
        ),
      ),
      onTap: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondAnimation) {
              return MatchNotification();
            });
      },
    );
  }
}
