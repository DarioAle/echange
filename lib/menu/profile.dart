import 'package:echange/matches/matches.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);
// TODO: Add personal from app storage (name)
// TODO: Add navigaton onclick for each List tile
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 241, 222, 1),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
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
                    backgroundColor: Color.fromRGBO(242, 204, 143, 1),
                    child: Image.asset("assets/images/woman.png"),
                    minRadius: 60,
                    maxRadius: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Margarita Perez"),
                SizedBox(
                  height: 8,
                ),
                Text("mago@mail.com"),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text("Mis items"),
                  leading: Image.asset(
                    "assets/images/plant_colored.png",
                    height: 50,
                  ),
                  minVerticalPadding: 20,
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                GestureDetector(
                  child: ListTile(
                    title: Text("Matches"),
                    leading: Image.asset(
                      "assets/images/relationship.png",
                      height: 50,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Matches())
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Prospectos"),
                  leading: Image.asset(
                    "assets/images/Prospects.png",
                    height: 50,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Favoritos"),
                  leading: Image.asset(
                    "assets/images/love.png",
                    height: 50,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Configuración de cuenta"),
                  leading: Image.asset(
                    "assets/images/configuration.png",
                    height: 50,
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Cerrar sesión"),
                  leading: Image.asset(
                    "assets/images/logout.png",
                    height: 50,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
