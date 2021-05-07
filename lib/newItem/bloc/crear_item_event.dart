part of 'crear_item_bloc.dart';

abstract class CrearItemEvent extends Equatable {
  const CrearItemEvent();

  @override
  List<Object> get props => [];
}

class SaveNewItemEvent extends CrearItemEvent {
  final Item it;

  SaveNewItemEvent({@required this.it});

  @override
  List<Object> get props => [it];

}

class PickImageEvent extends CrearItemEvent {
  @override 
  List<Object> get props => [];
}
