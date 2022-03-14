import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/enums/word_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class WordModel {
  late Map<int, LetterModel> model;
  WordState state;

  //todo: needed?
  WordModel(String word)
      : assert(word.length == Constants.lettersInWord),
        state = WordState.notStarted,
        model = <int, LetterModel>{} {
    _fillModel(word);
  }

  WordModel.empty() : state = WordState.notStarted {
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

    // Important to create a brand new letter with an unchecked state
    model[index] = LetterModel(letter.char);
  }

  void removeLetter(int index) {
    assert(index >= 0 && index < Constants.lettersInWord);

    model[index] = LetterModel('');
  }

  //todo: maybe take a Word object as an argument? also rename, not clear at the moment
  void check(String word) {
    //todo: assert it is a valid word?
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

      state = WordState.checked;
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

  bool isEqual(WordModel anotherWord) => toString() == anotherWord.toString();
}
