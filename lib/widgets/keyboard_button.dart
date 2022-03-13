import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/cubits/field_cubit.dart';
import 'package:flutter_wordle_clone/models/helpers/letter_state.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class KeyboardButton extends StatelessWidget {
  final LetterModel letter;
  final KeyboardButtonType buttonType;

  const KeyboardButton(this.letter,
      {this.buttonType = KeyboardButtonType.letter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: pass size from config
    final double width = MediaQuery.of(context).size.width * 0.08;
    final double height = MediaQuery.of(context).size.width * 0.08;

    return GestureDetector(
      onTap: () {
        //todo: handle enter and remove
        context.read<FieldCubit>().enterLetter(letter);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: _getBackgroundColorByState(letter.state),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(letter.char, style: const TextStyle(fontSize: 36)),
      ),
    );
  }

  Color _getBackgroundColorByState(LetterState state) {
    switch (state) {
      case LetterState.correctSpot:
        return green;
      case LetterState.wrongSpotButPresent:
        return yellow;
      case LetterState.notPresent:
        return darkGrey;
      case LetterState.unchecked:
        return lightGrey;
      default:
        return lightGrey;
    }
  }

  Widget genChildF
}

enum KeyboardButtonType { letter, enter, remove }
