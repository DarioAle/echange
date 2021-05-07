part of 'match_bloc.dart';

abstract class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

class MatchInitial extends MatchState {}

class LoadingState extends MatchState {}

class LoadedMatchesState extends MatchState {
  final List<Matches> matchesList;

  LoadedMatchesState({@required this.matchesList});
  @override
  List<Object> get props => [matchesList];
}

class ErrorMessageState extends MatchState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
