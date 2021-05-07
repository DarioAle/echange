import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echange/models/item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _cFirestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if(event is RequestAllItems) {
      yield LoadingState();
      yield LoadedItemsState(itemList: await _getItems() ?? []);
    }
  }

  Future<List<Item>> _getItems() async {
    try {
      var items = await _cFirestore.collection("yourItem").get();
      return items.docs
          .map(
            (element) => Item(
                category: element['category'],
                description: element['description'],
                name: element['name'],
                size: element['size'],
                state: element['state'],
                urlPicture: element['urlPicture']),
          )
          .toList();
    } catch (e) {
      print("Could not bring items from firebase ---Error: $e");
      return [];
    }
  }
}
