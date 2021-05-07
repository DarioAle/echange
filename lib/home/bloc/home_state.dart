part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class LoadedItemsState extends HomeState {
  final List<Item> itemList;

  LoadedItemsState({@required this.itemList});
  @override
  List<Object> get props => [itemList];
}

class ErrorMessageState extends HomeState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
