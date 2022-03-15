import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/helpers/word_helper.dart';
import 'package:flutter_wordle_clone/models/enums/game_state_enum.dart';
import 'package:flutter_wordle_clone/models/keyboard_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';

class FieldModel {
  int activeCellIndex;
  int activeWordIndex;
  Map<int, WordModel> words;
  KeyboardModel keyboard;
  late WordModel winnerWord;
  GameResultState gameResultState;

  FieldModel.start()
      : activeCellIndex = 0,
        activeWordIndex = 0,
        gameResultState = GameResultState.active,
        words = <int, WordModel>{},
        keyboard = KeyboardModel() {
    _prepareWords();
    _selectWinner();

    //log(winnerWord.toString());
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
    if (gameResultState != GameResultState.active ||
        isCurrentWordComplete == true) {
      return;
    }

    words[activeWordIndex]!.addLetter(activeCellIndex, letter);

    if (!isAtLastLetterOfWord) {
      activeCellIndex += 1;
      assert(activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);
    }

    //log("added letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  void removeLetter() {
    if (gameResultState != GameResultState.active) {
      return;
    }

    if (!isAtFirstLetterOfWord) {
      // What the next couple of rows mean is that the focus doesn't move to the previous cell, if we are at the last letter of the word and it is not empty
      // Basically, it means that we have to remove the last letter first, because it is not empty, and only then go the previous cell
      if (!(isAtLastLetterOfWord &&
          words[activeWordIndex]!.model[activeCellIndex]!.isEmpty == false)) {
        activeCellIndex -= 1;
        assert(
            activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);
      }
    }
    words[activeWordIndex]!.removeLetter(activeCellIndex);

    //log("removed letter, now activeCellIndex is: " + activeCellIndex.toString());
  }

  void submitWord() {
    if (gameResultState != GameResultState.active ||
        isCurrentWordComplete == false) {
      return;
    }

    words[activeWordIndex]!.check(winnerWord.toString());

    if (isWon == true) {
      gameResultState = GameResultState.won;
      return;
    } else {
      if (isAtLastWord == true) {
        gameResultState = GameResultState.lost;
        return;
      } else {
        keyboard.updateKeyboard(words);

        activeCellIndex = 0;
        assert(
            activeCellIndex >= 0 && activeCellIndex < Constants.lettersInWord);

        activeWordIndex += 1;
        assert(
            activeWordIndex >= 0 && activeWordIndex < Constants.numberOfWords);
      }
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
  WordModel get currentWord => words[activeWordIndex]!;
  bool get isCurrentWordValid => WordHelper.isValidWord(currentWord.toString());
  bool get isCurrentWordComplete => words[activeWordIndex]!.isWordComplete();
}
