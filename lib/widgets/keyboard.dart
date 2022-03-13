import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/widgets/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final FieldModel
      field; //todo: this is more of a game model actually!!! rename

  const Keyboard(this.field, {Key? key}) : super(key: key);

  //todo: keyboard model?
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //todo: and what about special buttons?
      Row(children: <Widget>[
        KeyboardButton(letter: LetterModel('Q')),
        KeyboardButton(letter: LetterModel('W')),
        KeyboardButton(letter: LetterModel('E')),
        KeyboardButton(letter: LetterModel('R')),
        KeyboardButton(letter: LetterModel('T')),
        KeyboardButton(letter: LetterModel('Y')),
        KeyboardButton(letter: LetterModel('U')),
        KeyboardButton(letter: LetterModel('I')),
        KeyboardButton(letter: LetterModel('O')),
        KeyboardButton(letter: LetterModel('P')),
      ]),
      Row(children: <Widget>[
        KeyboardButton(letter: LetterModel('A')),
        KeyboardButton(letter: LetterModel('S')),
        KeyboardButton(letter: LetterModel('D')),
        KeyboardButton(letter: LetterModel('F')),
        KeyboardButton(letter: LetterModel('G')),
        KeyboardButton(letter: LetterModel('H')),
        KeyboardButton(letter: LetterModel('J')),
        KeyboardButton(letter: LetterModel('K')),
        KeyboardButton(letter: LetterModel('L')),
      ]),
      Row(children: <Widget>[
        const KeyboardButton(buttonType: KeyboardButtonType.enter),
        KeyboardButton(letter: LetterModel('Z')),
        KeyboardButton(letter: LetterModel('X')),
        KeyboardButton(letter: LetterModel('C')),
        KeyboardButton(letter: LetterModel('V')),
        KeyboardButton(letter: LetterModel('B')),
        KeyboardButton(letter: LetterModel('N')),
        KeyboardButton(letter: LetterModel('M')),
        const KeyboardButton(buttonType: KeyboardButtonType.remove),
      ]),
    ]);
  }

  // List<Widget> _genKeyboardButtonRow(KeyboardRowType type) => field.keyboard
  //     .getLettersRow(type)
  //     .map((letter) => KeyboardButton(letter))
  //     .toList();
}
