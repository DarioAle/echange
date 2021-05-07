part of 'crear_item_bloc.dart';

abstract class CrearItemState extends Equatable {
  const CrearItemState();

  @override
  List<Object> get props => [];
}

class CrearItemInitial extends CrearItemState {}

class LoadingState extends CrearItemState {}

class PickedImageState extends CrearItemInitial {
  final File image;

  PickedImageState({@required this.image});

  @override
  List<Object> get props => [image];
}

class SavedNewState extends CrearItemInitial {
  List<Object> get props => [];
}

class ErrorMessageState extends CrearItemInitial {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
