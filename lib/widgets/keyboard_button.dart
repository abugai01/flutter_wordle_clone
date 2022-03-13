import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/cubits/field_cubit.dart';
import 'package:flutter_wordle_clone/models/enums/letter_state_enum.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';

class KeyboardButton extends StatelessWidget {
  final LetterModel? letter;
  final KeyboardButtonType buttonType;

  const KeyboardButton(
      {this.letter, this.buttonType = KeyboardButtonType.letter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo: pass size from config
    final double width = MediaQuery.of(context).size.width * 0.08;
    final double height = MediaQuery.of(context).size.height * 0.06;

    return GestureDetector(
      onTap: () {
        if (buttonType == KeyboardButtonType.letter) {
          context.read<FieldCubit>().addLetter(letter!); //todo: null safety!
          HapticFeedback.vibrate();
        } else if (buttonType == KeyboardButtonType.enter) {
          context.read<FieldCubit>().trySubmitWord();
          HapticFeedback.vibrate(); //todo: some other type of vibration?
        } else if (buttonType == KeyboardButtonType.remove) {
          context.read<FieldCubit>().removeLetter();
          HapticFeedback.vibrate();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2.5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: _getBackgroundColor(buttonType, letter),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: _genChildByType(buttonType),
        ),
      ),
    );
  }

  Color _getBackgroundColor(
      KeyboardButtonType buttonType, LetterModel? letter) {
    if (buttonType == KeyboardButtonType.letter) {
      //todo: null safety!
      return _getBackgroundColorByState(letter!.state);
    } else {
      return lightGrey;
    }
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

  Widget _genChildByType(KeyboardButtonType type) {
    switch (type) {
      case KeyboardButtonType.letter:
        return Align(
            alignment: Alignment.center,
            //todo: null safety
            child: Text(letter!.char, style: const TextStyle(fontSize: 18)));
      case KeyboardButtonType.enter:
        return const Align(
            alignment: Alignment.center,
            child: Text('ENTER',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)));
      case KeyboardButtonType.remove:
        return const Icon(Icons.backspace_outlined);
    }
  }
}

enum KeyboardButtonType { letter, enter, remove }
