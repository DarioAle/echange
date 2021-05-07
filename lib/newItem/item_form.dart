import 'dart:io';

import 'package:echange/menu/menu.dart';
import 'package:echange/models/item.dart';
import 'package:echange/newItem/bloc/crear_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemForm extends StatefulWidget {
  ItemForm({Key key}) : super(key: key);

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CrearItemBloc _crearItemBloc;
  File selectedImage;

  var nombreTc = TextEditingController();
  var categoriaTc = TextEditingController();
  var descripcionTc = TextEditingController();
  var tallaTc = TextEditingController();
  var estadoTc = TextEditingController();
  File imagen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _crearItemBloc = CrearItemBloc();
        return _crearItemBloc;
      },
      child: BlocConsumer<CrearItemBloc, CrearItemState>(
        listener: (context, state) {
          if (state is PickedImageState) {
            selectedImage = state.image;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Imagen seleccionada"),
                ),
              );
          } else if (state is SavedNewState) {
            // TODO call other bloc to update my items
            nombreTc.clear();
            categoriaTc.clear();
            descripcionTc.clear();
            tallaTc.clear();
            estadoTc.clear();
          } else if (state is ErrorMessageState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("${state.errorMsg}"),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return _createForm();
        },
      ),
    );
  }

  // Show the form
  Widget _createForm() {
    return Scaffold(
      // key: _scaffoldKey,
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
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Agregar nueva prenda",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 25)),
              SizedBox(height: 10),
              TextField(
                controller: nombreTc,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Nombre",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descripcionTc,
                maxLines: 2,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Descripción",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descripcionTc,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText:
                        "Categoría (Vestido, Bottom, Zapatos, Accesorios)",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 10),
              TextField(
                controller: tallaTc,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Talla (XCH, CH, M, G, XG)",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 10),
              TextField(
                controller: estadoTc,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Estado (Nuevo, seminuevo, usado)",
                    hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 10),
              MaterialButton(
                child: Text("Agregar foto",
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  _crearItemBloc.add(PickImageEvent());
                },
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
                onPressed: () {
                  _crearItemBloc.add(
                    SaveNewItemEvent(
                      it: Item(
                          category: categoriaTc.text,
                          description: descripcionTc.text,
                          name: nombreTc.text,
                          ownerEmail: 'mariana@chavez.com',
                          ownerName: 'Mariana Chavez',
                          ownerPicture: 'what?',
                          size: tallaTc.text,
                          state: estadoTc.text,
                      ),
                    ),
                  );
                },
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
