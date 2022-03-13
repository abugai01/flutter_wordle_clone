import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/helpers/word_helper.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';

//todo: add assertions!
//todo: is this actually a game model?
class FieldModel {
  int activeCellIndex; //todo: private fields with a getter?
  late Map<int, String> inputs; //todo: remove this shit!!
  late Map<int, Word>
      words; //todo: should it be word structs too //todo: maybe it is better that inputs?
  late Word winner;

  FieldModel.start() : activeCellIndex = 0 {
    _prepareInputs();
    _prepareWords();
    _selectWinner();
  }

  void _prepareInputs() {
    for (int i = 0; i < Constants.numberOfCells - 1; i++) {
      inputs[i] = '';
    }
  }

  void _prepareWords() {
    for (int i = 0; i < Constants.numberOfWords - 1; i++) {
      words[i] = Word.empty();
    }
  }

  void _selectWinner() {
    winner = Word(WordHelper().getRandomWord());
  }

  void enterLetter(LetterModel letter) {
    inputs[activeCellIndex] = letter.char;

    //todo: null safety!!!
    words[currentWordIndex]!.addLetter(currentWordIndex, letter);

    activeCellIndex += 1;
    //todo: handle non-existing word here? should not go further if the word is not taken!
    //todo: what about submitting a row?
  }

  void removeLetter() {
    inputs[activeCellIndex] = '';

    //todo: null safety!!!
    words[currentWordIndex]!.removeLetter(currentWordIndex);
  }

  bool isLastLetterOfWord() {
    if ((activeCellIndex + 1) % Constants.lettersInWord == 0) {
      return true;
    } else {
      return false;
    }
  }

  //todo: this should definitely be somewhere else... it's a logic component

  bool isLastLetterOfField() =>
      activeCellIndex == Constants.numberOfCells - 1 ? true : false;

  int get currentWordIndex => Constants.numberOfCells ~/ (activeCellIndex + 1);

  Word? get currentWord =>
      words[currentWordIndex] ?? null; //todo: null safety here!!!
  String get currentLetter =>
      inputs[activeCellIndex] ?? ''; //todo: null safety here!!!

}
