part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GetCategories extends GameEvent {}

class SelectCategory extends GameEvent {
  SelectCategory({
    required this.idSelected,
  });
  final int idSelected;
}
