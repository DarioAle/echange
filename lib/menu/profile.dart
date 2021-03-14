import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150,
                  child: CircleAvatar(
                    child: Image.asset("assets/images/woman.png"),
                    minRadius: 40,
                    maxRadius: 80,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Margarita"),
                SizedBox(
                  height: 8,
                ),
                Text("mago@mail.com"),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text("cart"),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Wishes"),
                  leading: Icon(Icons.thumb_up),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("His"),
                  leading: Icon(Icons.store),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("set"),
                  leading: Icon(Icons.settings),
                  onTap: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Logout"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
