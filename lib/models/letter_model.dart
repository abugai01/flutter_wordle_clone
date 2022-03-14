import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';

class LetterModel {
  final String char;
  LetterState state;

  LetterModel(this.char)
      : assert(char.length == 0 || char.length == 1),
        state = LetterState.unchecked;

  bool get isEmpty => char == '';
}
