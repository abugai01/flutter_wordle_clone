import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/models/helpers/letter_state.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class CellLetter extends StatelessWidget {
  final LetterModel letter;

  const CellLetter(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width * 0.15;

    return Text(letter.char,
        style: TextStyle(
            fontSize: 36, color: _getLetterColorByState(letter.state)));
  }

  Color _getLetterColorByState(state) {
    if (state == LetterState.unchecked) {
      return black;
    } else {
      return white;
    }
  }
}
