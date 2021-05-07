import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echange/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'crear_item_event.dart';
part 'crear_item_state.dart';

class CrearItemBloc extends Bloc<CrearItemEvent, CrearItemState> {
  final _cFirestore = FirebaseFirestore.instance;
  File _selectedPicture;

  CrearItemBloc() : super(CrearItemInitial());

  @override
  Stream<CrearItemState> mapEventToState(
    CrearItemEvent event,
  ) async* {
    // pick an image
    if (event is PickImageEvent) {
      try {
        yield LoadingState();
        _selectedPicture = await _getImage();
        yield PickedImageState(image: _selectedPicture);
      } catch (e) {
        yield ErrorMessageState(errorMsg: "Error al tomar la imagen");
      }
    }
    //
    else if (event is SaveNewItemEvent) {
      if (_selectedPicture == null)
        yield ErrorMessageState(errorMsg: "Imagen no seleccionada");

      String imageUrl = await _uploadFile();
      try {
        if (imageUrl != null) {
          yield LoadingState();
          await _saveItems(event.it.copyWith(urlPicture: imageUrl));
          yield SavedNewState();
          _selectedPicture = null;
        } else {
          yield ErrorMessageState(errorMsg: "Error al cargar la imagen");
        }
      } catch (e) {
        yield ErrorMessageState(errorMsg: "Error guardando la imagen");
      }
    }
  }

  // save to firestore
  Future<bool> _saveItems(Item itm) async {
    try {
      print(itm.toJson());
      await _cFirestore.collection("yourItem").add(itm.toJson());
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<String> _uploadFile() async {
    try {
      var stamp = DateTime.now();
      if (_selectedPicture == null) return null;
      // define upload task
      UploadTask task = FirebaseStorage.instance
          .ref(
              "pictures/imagen_$stamp.png") // revisa que esta linea funcione despues
          .putFile(_selectedPicture);
      // execute task
      await task;
      // recuperar url del documento subido
      return await task.storage
          .ref("pictures/imagen_$stamp.png")
          .getDownloadURL();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print("Error al subir la imagen a Storage: $e");
      return null;
    } catch (e) {
      // error
      print("Error al subir la imagen a Storage: $e");
      return null;
    }
  }

  // pick an image
  Future<File> _getImage() async {
    // pick image from camera and return the path if succesful
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }
}
