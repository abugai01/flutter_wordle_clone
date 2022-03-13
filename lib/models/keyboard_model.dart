import 'dart:core';

import 'package:flutter_wordle_clone/helpers/keyboard_helper.dart';
import 'package:flutter_wordle_clone/models/enums/keyboard_row_type_enum.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';

class KeyboardModel {
  Map<String, LetterModel> letters;

  KeyboardModel() : letters = <String, LetterModel>{} {
    _fillLetters();
  }

  void _fillLetters() {
    for (int i = 0; i < KeyboardHelper.letters.length; i++) {
      letters[KeyboardHelper.letters[i]] =
          LetterModel(KeyboardHelper.letters[i]);
    }
  }

  List<LetterModel> getLettersRow(KeyboardRowType type) {
    List<LetterModel> res = [];

    // for (int i = 0; i < letters.length; i++) {
    //   //todo: is the order preserved???
    //   if (KeyboardHelper.isRowType(letters[i], type) == true) {
    //     res.add(letters[i]);
    //   }
    // }

    List<String> row = KeyboardHelper.getRowByType(type);
    for (int i = 0; i < row.length; i++) {
      res.add(letters[row[i]]!);
      //todo: null safety!!
    }

    return res;
  }

  void updateKeyboard(Map<int, WordModel> words) {
    for (int i = 0; i < words.length; i++) {
      //todo: null safety!
      for (int j = 0; j < words[i]!.model.length; j++) {
        //todo: maybe no need to check everything, only submitted words

        // If a correct spot has been found, just mark the letter green
        if (words[i]!.model[j]!.state == LetterState.correctSpot) {
          letters[words[i]!.model[j]!.char]!.state = LetterState.correctSpot;
        }
        // If a wrong spot has been found, make sure that the correct spot hasn't been found elsewhere and then mark the letter yellow
        else if (words[i]!.model[j]!.state == LetterState.wrongSpotButPresent &&
            letters[words[i]!.model[j]!.char]!.state !=
                LetterState.correctSpot) {
          letters[words[i]!.model[j]!.char]!.state =
              LetterState.wrongSpotButPresent;
        }
        // If a non-present letter has been found, mark it grey
        else if (words[i]!.model[j]!.state == LetterState.notPresent) {
          letters[words[i]!.model[j]!.char]!.state = LetterState.notPresent;
        }
      }
    }
  }
}
