import 'package:flutter_wordle_clone/models/field_model.dart';

abstract class FieldState {}

class FieldGenericState extends FieldState {
  final FieldModel field;

  FieldGenericState({required this.field});
}
