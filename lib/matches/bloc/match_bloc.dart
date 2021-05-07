import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:echange/models/match.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final _cFirestore = FirebaseFirestore.instance;
  MatchBloc() : super(MatchInitial());

  @override
  Stream<MatchState> mapEventToState(
    MatchEvent event,
  ) async* {
    if (event is RequestAllMatches) {
      yield LoadingState();
      yield LoadedMatchesState(matchesList: await _getMatches() ?? []);
    }
  }

  // recurpera la lista de docs en firestore
// map a objet de dart
// cada elemento agregarlo a una lista.
  Future<List<Matches>> _getMatches() async {
    try {
      var items = await _cFirestore.collection("matchItem").get();
      return items.docs
          .map(
            (element) => Matches(
              herEmail: element['herEmail'],
              herName: element['herName'],
              herPhone: element['herPhone'],
              herPicture: element['herPicture'],
              itemsYouLiked: element['itemsYouLiked'],
              yourItemsLiked: element['yourItemsLiked'],
            ),
          )
          .toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
