part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class LoadingState extends ProfileState {} 

class LoadedItemsState extends ProfileState {
  final List<Item> itemList;

  LoadedItemsState({@required this.itemList});
  @override
  List<Object> get props => [itemList];
}

class ErrorMessageState extends ProfileState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
