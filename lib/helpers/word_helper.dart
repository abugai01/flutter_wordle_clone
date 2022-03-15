import 'dart:math';

import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/config/words.dart';

class WordHelper {
  static bool isValidWord(String word) {
    if (word.length != Constants.lettersInWord) {
      return false;
    }

    return validInputs.contains(word);
  }

  String getRandomWord() =>
      Words.answers[Random().nextInt(Words.answers.length)];

  static List<String> get validInputs => Words.answers + Words.allowedGuesses;
}
