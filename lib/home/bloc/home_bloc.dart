import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:echange/models/item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _cFirestore = FirebaseFirestore.instance;

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is RequestAllItems) {
      yield LoadingState();
      yield LoadedItemsState(itemList: await _getItems() ?? []);
    }
  }

  // recurpera la lista de docs en firestore
// map a objet de dart
// cada elemento agregarlo a una lista.
  Future<List<Item>> _getItems() async {
    try {
      var items = await _cFirestore.collection("item").get();
      return items.docs
          .map(
            (element) => Item(
                category: element['category'],
                description: element['description'],
                name: element['name'],
                ownerEmail: element['ownerEmail'],
                ownerName: element['ownerName'],
                ownerPicture: element['ownerPicture'],
                size: element['size'],
                state: element['state'],
                urlPicture: element['urlPicture']),
          )
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
