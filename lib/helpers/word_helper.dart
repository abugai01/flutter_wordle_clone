import 'dart:math';

import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/config/words.dart';

class WordHelper {
  static bool checkWord(String word) {
    if (word.length != Constants.lettersInWord) {
      return false;
    }

    return validInputs.contains(word);
  }

  //todo: optimize by knowing the length in advance?
  String getRandomWord() =>
      Words.playable[Random().nextInt(Words.playable.length)];

  //todo: optimize by generating a concatenated list in advance
  static List<String> get validInputs =>
      Words.playable + Words.enterableNotPlayable;
}
