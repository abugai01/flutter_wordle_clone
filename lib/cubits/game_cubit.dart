import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/cubits/states/game_state.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/widgets/show_alert_window.dart';

class GameCubit extends Cubit<GameState> {
  late FieldModel _field;

  GameCubit() : super(GameInitState()) {
    _field = FieldModel.start();
    emit(GameGenericState(field: _field));
  }

  void addLetter(LetterModel letter) {
    _field.addLetter(letter);
    emit(GameGenericState(field: _field));
  }

  void removeLetter() {
    _field.removeLetter();
    emit(GameGenericState(field: _field));
  }

  void trySubmitWord(BuildContext context) {
    if (_field.isCurrentWordComplete == false) {
      return;
    }

    if (_field.isCurrentWordValid == false) {
      showAlertWindow(context,
          title: 'Invalid word', subtitle: 'Not in word list');
      return;
    } else {
      _field.submitWord();
      emit(GameGenericState(field: _field));
    }
  }

  void newGame() {
    _field = FieldModel.start();
    emit(GameGenericState(field: _field));
  }
}
