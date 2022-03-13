import 'package:flutter_wordle_clone/models/helpers/letter_state.dart';

class LetterModel {
  final String char;
  LetterState state;

  LetterModel(this.char)
      : assert(char.length == 1),
        state = LetterState.unchecked;
}
