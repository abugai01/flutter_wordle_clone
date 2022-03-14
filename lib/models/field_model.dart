import 'dart:developer';

import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/helpers/word_helper.dart';
import 'package:flutter_wordle_clone/models/enums/game_state_enum.dart';
import 'package:flutter_wordle_clone/models/enums/word_state_enum.dart';
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
  GameState gameState;

  FieldModel.start()
      : activeCellIndex = 0,
        activeWordIndex = 0,
        gameState = GameState.active,
        words = <int, WordModel>{},
        keyboard = KeyboardModel() {
    _prepareWords();
    _selectWinner();

    log(winnerWord.toString()); //todo: this appears 2 times... find out why!
  }

  void _prepareWords() {
    for (int i = 0; i < Constants.numberOfWords; i++) {
      words[i] = WordModel.empty();

      if (i == 0) {
        //todo: null safety!
        words[i]!.state = WordState.active;
      }
    }
  }

  //todo: show winner in snack bar!

  void _selectWinner() {
    winnerWord = WordModel(WordHelper().getRandomWord());
  }

  void addLetter(LetterModel letter) {
    if (gameState != GameState.active) {
      return;
    }

    //todo: null safety!!!
    words[activeWordIndex]!.addLetter(activeCellIndex, letter);

    if (!isAtLastLetterOfWord) {
      activeCellIndex += 1;
    }

    log("added letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  //todo: is there an easier way?
  void removeLetter() {
    if (gameState != GameState.active) {
      return;
    }

    //todo: null safety!!! + explain why!
    if (!isAtFirstLetterOfWord) {
      if (!(isAtLastLetterOfWord &&
          words[activeWordIndex]!.model[activeCellIndex]!.isEmpty == false)) {
        activeCellIndex -= 1;

        //todo: check if the last (5th) letter is empty. If yes, then we are actually still at the 4th letter, if not, remove the 5th!
      }
    }
    words[activeWordIndex]!.removeLetter(activeCellIndex);

    log("removed letter, now activeCellIndex is: " +
        activeCellIndex.toString());
  }

  void trySubmitWord() {
    if (gameState != GameState.active) {
      return;
    }

    if (WordHelper.checkWord(currentWord.toString()) != true) {
      return;
    }

    //todo: null safety here!!!
    words[activeWordIndex]!.check(winnerWord.toString());

    if (isWon == true) {
      gameState = GameState.won;
      return;
    } else {
      if (isAtLastWord == true) {
        gameState = GameState.lost;
        return;
      } else {
        keyboard.updateKeyboard(words);
        activeCellIndex = 0;
        activeWordIndex += 1;
        words[activeWordIndex]!.state = WordState.active;
      }
      //todo: else maybe vibrate on incorrect ?
    }
  }

  bool get isWon => currentWord.isEqual(winnerWord) == true;

  bool get isAtFirstLetterOfWord => activeCellIndex == 0;
  bool get isAtLastLetterOfWord =>
      activeCellIndex == Constants.lettersInWord - 1;
  // bool get isAtLastLetterOfField =>
  //     activeWordIndex == Constants.numberOfWords - 1 &&
  //     isAtLastLetterOfWord == true;
  bool get isAtLastWord => activeWordIndex == Constants.numberOfWords - 1;

  WordModel get currentWord => words[activeWordIndex]!; //todo: null safety

}
