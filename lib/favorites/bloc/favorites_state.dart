part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class LoadingState extends FavoritesState {}

class LoadedFavoritesState extends FavoritesState {
  final List<FavItem> favList;

  LoadedFavoritesState({@required this.favList});
  @override
  List<Object> get props => [favList];
}

class ErrorMessageState extends FavoritesState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
