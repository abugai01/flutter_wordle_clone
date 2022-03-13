import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/widgets/cell_letter.dart';

class Cell extends StatelessWidget {
  final LetterModel letter;

  const Cell(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width * 0.15;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        height: side,
        width: side,
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColorByState(letter.state)),
          color: _getBackgroundColorByState(letter.state),
        ),
        child: CellLetter(letter),
      ),
    );
  }

  //todo: same as keyboard button!
  Color _getBackgroundColorByState(LetterState state) {
    switch (state) {
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
  }

  Color _getBorderColorByState(LetterState state) {
    if (state == LetterState.unchecked) {
      return grey;
    } else {
      return white;
    }
  }
}
