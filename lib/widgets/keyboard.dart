import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/widgets/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final FieldModel
      field; //todo: this is more of a game model actually!!! rename

  const Keyboard(this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //todo: is there a better way to organize this?
      Row(children: <Widget>[
        KeyboardButton(LetterModel('Q')),
        KeyboardButton(LetterModel('W')),
        KeyboardButton(LetterModel('E')),
        KeyboardButton(LetterModel('R')),
        KeyboardButton(LetterModel('T')),
        KeyboardButton(LetterModel('Y')),
        KeyboardButton(LetterModel('U')),
        KeyboardButton(LetterModel('I')),
        KeyboardButton(LetterModel('O')),
        KeyboardButton(LetterModel('P')),
      ]),
      Row(children: <Widget>[
        KeyboardButton(LetterModel('A')),
        KeyboardButton(LetterModel('S')),
        KeyboardButton(LetterModel('D')),
        KeyboardButton(LetterModel('F')),
        KeyboardButton(LetterModel('G')),
        KeyboardButton(LetterModel('H')),
        KeyboardButton(LetterModel('J')),
        KeyboardButton(LetterModel('K')),
        KeyboardButton(LetterModel('L')),
      ]),
      Row(children: <Widget>[
        KeyboardButton(LetterModel('-')), //todo: special button
        KeyboardButton(LetterModel('Z')),
        KeyboardButton(LetterModel('X')),
        KeyboardButton(LetterModel('C')),
        KeyboardButton(LetterModel('V')),
        KeyboardButton(LetterModel('B')),
        KeyboardButton(LetterModel('N')),
        KeyboardButton(LetterModel('M')),
        KeyboardButton(LetterModel('-')), //todo: special button
      ]),
    ]);
  }
}
