import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:echange/models/fav_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final _cFirestore = FirebaseFirestore.instance;

  FavoritesBloc() : super(FavoritesInitial());

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is RequestAllFavorites) {
      yield LoadingState();
      yield LoadedFavoritesState(favList: await _getFavs() ?? []);
    }
  }

  Future<List<FavItem>> _getFavs() async {
    try {
      var items = await _cFirestore.collection("favItem").get();
      return items.docs
          .map(
            (element) => FavItem(
                category: element['category'],
                description: element['description'],
                name: element['name'],
                ownerEmail: element['ownerEmail'],
                ownerName: element['ownerName'],
                ownerPicture: element['ownerPicture'],
                ownerPhone: element['ownerPhone'],
                size: element['size'],
                status: element['status'],
                urlPicture: element['urlPicture']),
          )
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
