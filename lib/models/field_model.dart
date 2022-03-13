import 'dart:developer';

import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/helpers/word_helper.dart';
import 'package:flutter_wordle_clone/models/keyboard_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';

//todo: add assertions!
//todo: block input if all 5 letters are entered
//todo: is this actually a game model?
class FieldModel {
  int activeCellIndex;
  int activeWordIndex;
  Map<int, WordModel> words;
  KeyboardModel keyboard;
  late WordModel winnerWord;

  FieldModel.start()
      : activeCellIndex = 0,
        activeWordIndex = 0,
        words = <int, WordModel>{},
        keyboard = KeyboardModel() {
    _prepareWords();
    _selectWinner();

    log(winnerWord.toString()); //todo: this appears 2 times... find out why!
  }

  void _prepareWords() {
    for (int i = 0; i < Constants.numberOfWords; i++) {
      words[i] = WordModel.empty();
    }
  }

  void _selectWinner() {
    winnerWord = WordModel(WordHelper().getRandomWord());
  }

  void addLetter(LetterModel letter) {
    //todo: null safety!!!
    words[activeWordIndex]!.addLetter(activeCellIndex, letter);

    if (!isAtLastLetterOfWord) {
      activeCellIndex += 1;
    }

    log("added letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  void removeLetter() {
    //todo: null safety!!! + explain why!
    if (!isAtFirstLetterOfWord) {
      activeCellIndex -=
          1; //todo: check if the last (5th) letter is empty. If yes, then we are actually still at the 4th letter, if not, remove the 5th!
    }
    words[activeWordIndex]!.removeLetter(activeCellIndex);

    log("removed letter, now activeCellIndex is: " +
        activeCellIndex.toString());
  }

  void trySubmitWord() {
    if (WordHelper.checkWord(currentWord.toString()) == true) {
      //todo: null safety here!!!
      words[activeWordIndex]!.check(winnerWord.toString());
      keyboard.updateKeyboard(words);
      activeCellIndex = 0;
      activeWordIndex += 1;
    }
    //todo: else maybe vibrate on incorrect ?
  }

  bool get isAtFirstLetterOfWord => activeCellIndex == 0;
  bool get isAtLastLetterOfWord =>
      activeCellIndex == Constants.lettersInWord - 1;
  bool get isAtLastLetterOfField =>
      activeWordIndex == Constants.numberOfWords - 1 &&
      isAtLastLetterOfWord == true;

  WordModel get currentWord => words[activeWordIndex]!; //todo: null safety

}
