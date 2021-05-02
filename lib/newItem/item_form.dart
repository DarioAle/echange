import 'dart:io';

import 'package:echange/menu/menu.dart';
import 'package:flutter/material.dart';

class ItemForm extends StatefulWidget {
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var nombre = TextEditingController();
  var descripcion = TextEditingController();
  var talla = TextEditingController();
  var estado = TextEditingController();
  File imagen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(242, 204, 143, 1),
      endDrawer: new Drawer(
        child: Menu(),
      ),
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/plant.png')),
        backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Agregar nueva prenda",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 25)),
              SizedBox(height: 10),
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Nombre"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descripcion,
                maxLines: 2,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Descripción"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: talla,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Talla (XCH, CH, M, G, XG)"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: estado,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Estado (Nuevo, seminuevo, usado)"),
              ),
              SizedBox(height: 10),
              MaterialButton(
                child: Text("Agregar foto",
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {},
                color: Color.fromRGBO(224, 122, 95, 1),
              ),
              SizedBox(height: 5),
              imagen != null
                  ? Image.file(
                      imagen,
                      fit: BoxFit.contain,
                      height: 110,
                      width: 100,
                    )
                  : Container(
                      height: 110,
                      width: 100,
                      child: Placeholder(),
                    ),
              SizedBox(height: 15),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 80,
                child: Text("Añadir prenda",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white)),
                onPressed: () {},
                color: Color.fromRGBO(61, 64, 91, 1),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 80,
                child: Text("Cancelar",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Color.fromRGBO(61, 64, 91, 1),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
