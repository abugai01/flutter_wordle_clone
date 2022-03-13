import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class WordModel {
  late Map<int, LetterModel> model;

  //todo: needed?
  WordModel(String word)
      : assert(word.length == Constants.lettersInWord),
        model = <int, LetterModel>{} {
    _fillModel(word);
  }

  WordModel.empty() {
    model = _genEmptyModel();
  }

  //todo: not safe to have this function! maybe an asserton would help
  void _fillModel(String word) {
    for (int i = 0; i < word.length; i++) {
      model[i] = LetterModel(word[i]);
    }
  }

  Map<int, LetterModel> _genEmptyModel() {
    Map<int, LetterModel> res = {};

    for (int i = 0; i < Constants.lettersInWord; i++) {
      res[i] = LetterModel('');
    }

    return res;
  }

  void addLetter(int index, LetterModel letter) {
    assert(index >= 0 && index < Constants.lettersInWord);

    model[index] = letter;
  }

  void removeLetter(int index) {
    assert(index >= 0 && index < Constants.lettersInWord);

    model[index] = LetterModel('');
  }

  //todo: maybe take a Word object as an argument?
  void check(String word) {
    assert(word.length == Constants.lettersInWord);
    assert(word.length == model.length);

    for (int i = 0; i < word.length; i++) {
      if (model[i]!.char == word[i]) {
        model[i]!.state = LetterState.correctSpot;
      } else if (word.contains(model[i]!.char)) {
        model[i]!.state = LetterState.wrongSpotButPresent;
      } else {
        model[i]!.state = LetterState.notPresent;
      }
    }
  }

  @override
  String toString() {
    String res = '';

    for (int i = 0; i < model.length; i++) {
      //todo: null safety why??
      res += model[i]!.char;
    }

    return res;
  }
}
