import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/enums/word_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/widgets/cell_letter.dart';

class Cell extends StatelessWidget {
  final LetterModel letter;
  final WordState wordState;

  const Cell(this.letter, this.wordState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width * 0.15;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        height: side,
        width: side,
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(letter.state, wordState)),
          color: _getBackgroundColor(letter.state, wordState),
        ),
        child: CellLetter(letter),
      ),
    );
  }

  //todo: same as keyboard button!
  Color _getBackgroundColor(LetterState letterState, WordState wordState) {
    if (wordState == WordState.checked) {
      switch (letterState) {
        case LetterState.correctSpot:
          return green;
        case LetterState.wrongSpotButPresent:
          return yellow;
        case LetterState.notPresent:
          return darkGrey;
        case LetterState.unchecked:
          return white;
        default:
          return white;
      }
    } else {
      return white;
    }
  }

  //todo: no border at all instead of white!
  Color _getBorderColor(LetterState letterState, WordState wordState) {
    if (wordState == WordState.notStarted) {
      return lightGrey;
    } else if (wordState == WordState.active) {
      return darkGrey;
    } else {
      return white;
    }
  }
}
