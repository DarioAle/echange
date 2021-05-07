part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

// class LoadedNewsState extends HomeState {
//   final List<Item> noticiasList;

//   LoadedNewsState({@required this.noticiasList});
//   @override
//   List<Object> get props => [noticiasList];
// }

class ErrorMessageState extends HomeState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
