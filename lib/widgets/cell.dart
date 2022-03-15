import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class Cell extends StatelessWidget {
  final LetterModel letter;
  final bool _isSmall;

  const Cell(this.letter, {Key? key})
      : _isSmall = false,
        super(key: key);

  // This constructor is used for creating a rules explanation screen only!
  const Cell.small(this.letter, {Key? key})
      : _isSmall = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width *
        (_isSmall == true ? smallCellScreenWidthFactor : cellScreenWidthFactor);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        height: side,
        width: side,
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(letter)),
          color: _getBackgroundColor(letter),
        ),
        child: _CellLetter(
          letter,
          isSmall: _isSmall,
        ),
      ),
    );
  }

  Color _getBackgroundColor(LetterModel letter) {
    switch (letter.state) {
      case LetterState.correctSpot:
        return green;
      case LetterState.wrongSpotButPresent:
        return yellow;
      case LetterState.notPresent:
        return grey;
      case LetterState.unchecked:
        return white;
      default:
        return white;
    }
  }

  Color _getBorderColor(LetterModel letter) {
    if (letter.isEmpty == true) {
      return lightGrey;
    } else {
      if (letter.state == LetterState.unchecked) {
        return darkGrey;
      } else {
        return grey;
      }
    }
  }
}

class _CellLetter extends StatelessWidget {
  final LetterModel letter;
  final bool isSmall;

  const _CellLetter(this.letter, {this.isSmall = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Text(letter.char,
            style: TextStyle(
                fontSize: isSmall == true ? 20 : 36,
                color: _getLetterColorByState(letter.state),
                fontWeight: FontWeight.bold)));
  }

  Color _getLetterColorByState(state) {
    if (state == LetterState.unchecked) {
      return black;
    } else {
      return white;
    }
  }
}
