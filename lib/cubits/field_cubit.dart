import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/config/constants.dart';
import 'package:flutter_wordle_clone/cubits/states/field_state.dart';
import 'package:flutter_wordle_clone/helpers/word_helper.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';

//todo: handle non-existing words!
class FieldCubit extends Cubit<FieldState> {
  late FieldModel _field;

  //todo: possible to avoid doubling?
  FieldCubit() : super(FieldGenericState(field: FieldModel.start())) {
    _field = FieldModel.start();
  }

  //todo: what if we are at the last letter?
  void moveFocusToNextButton() {
    if (_field.activeCellIndex < Constants.numberOfCells - 1) {
      _field.activeCellIndex += 1;
      emit(FieldGenericState(field: _field));
    }
  }

  void moveFocusToPreviousButton() {
    if (_field.activeCellIndex > 0) {
      _field.activeCellIndex -= 1; //todo: probably logic inside the model?
      emit(FieldGenericState(field: _field));
    }
  }

  void enterLetter(LetterModel letter) {
    _field.enterLetter(letter);
    emit(FieldGenericState(field: _field));
    //todo: handle non-existing and move focus to the next cell
  }

  void removeLetter() {
    _field.removeLetter();
    emit(FieldGenericState(field: _field));
  }

  //todo: should be evoked every letter! or upon clicking enter?
  void runWordCheck() {
    if (_field.isLastLetterOfWord() == true) {
      _trySubmitWord(_field.currentWord.toString());
    }
  }

  //todO: unite with runWorldCheck
  void _trySubmitWord(String word) {
    if (WordHelper.checkWord(word) == true) {
      //todo: it should happen inside field model!!
      _field.words[_field.currentWordIndex]!.check(_field.winner.toString());
      moveFocusToNextButton();
    }
  }

  //todo: confirmation window!
  void resetGame() {
    _field = FieldModel.start();
    emit(FieldGenericState(field: _field));
  }
}
