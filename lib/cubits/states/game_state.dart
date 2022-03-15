import 'package:flutter_wordle_clone/models/field_model.dart';

abstract class GameState {}

class GameInitState extends GameState {}

class GameGenericState extends GameState {
  final FieldModel field;

  GameGenericState({required this.field});
}
