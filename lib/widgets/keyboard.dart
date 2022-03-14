import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/widgets/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final FieldModel
      field; //todo: this is more of a game model actually!!! rename

  const Keyboard(this.field, {Key? key}) : super(key: key);

  //todo: keyboard model?
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //todo: block keyboard if game not active or last letter, etc.
          Row(children: <Widget>[
            KeyboardButton(letter: field.keyboard.letters['Q']),
            KeyboardButton(letter: field.keyboard.letters['W']),
            KeyboardButton(letter: field.keyboard.letters['E']),
            KeyboardButton(letter: field.keyboard.letters['R']),
            KeyboardButton(letter: field.keyboard.letters['T']),
            KeyboardButton(letter: field.keyboard.letters['Y']),
            KeyboardButton(letter: field.keyboard.letters['U']),
            KeyboardButton(letter: field.keyboard.letters['I']),
            KeyboardButton(letter: field.keyboard.letters['O']),
            KeyboardButton(letter: field.keyboard.letters['P']),
          ]),
          Row(children: <Widget>[
            KeyboardButton(letter: field.keyboard.letters['A']),
            KeyboardButton(letter: field.keyboard.letters['S']),
            KeyboardButton(letter: field.keyboard.letters['D']),
            KeyboardButton(letter: field.keyboard.letters['F']),
            KeyboardButton(letter: field.keyboard.letters['G']),
            KeyboardButton(letter: field.keyboard.letters['H']),
            KeyboardButton(letter: field.keyboard.letters['J']),
            KeyboardButton(letter: field.keyboard.letters['K']),
            KeyboardButton(letter: field.keyboard.letters['L']),
          ]),
          Row(children: <Widget>[
            const KeyboardButton(buttonType: KeyboardButtonType.enter),
            KeyboardButton(letter: field.keyboard.letters['Z']),
            KeyboardButton(letter: field.keyboard.letters['X']),
            KeyboardButton(letter: field.keyboard.letters['C']),
            KeyboardButton(letter: field.keyboard.letters['V']),
            KeyboardButton(letter: field.keyboard.letters['B']),
            KeyboardButton(letter: field.keyboard.letters['N']),
            KeyboardButton(letter: field.keyboard.letters['M']),
            const KeyboardButton(buttonType: KeyboardButtonType.remove),
          ]),
          //   KeyboardButton(letter: LetterModel('Q')),
          //   KeyboardButton(letter: LetterModel('W')),
          //   KeyboardButton(letter: LetterModel('E')),
          //   KeyboardButton(letter: LetterModel('R')),
          //   KeyboardButton(letter: LetterModel('T')),
          //   KeyboardButton(letter: LetterModel('Y')),
          //   KeyboardButton(letter: LetterModel('U')),
          //   KeyboardButton(letter: LetterModel('I')),
          //   KeyboardButton(letter: LetterModel('O')),
          //   KeyboardButton(letter: LetterModel('P')),
          // ]),
          // Row(children: <Widget>[
          //   KeyboardButton(letter: LetterModel('A')),
          //   KeyboardButton(letter: LetterModel('S')),
          //   KeyboardButton(letter: LetterModel('D')),
          //   KeyboardButton(letter: LetterModel('F')),
          //   KeyboardButton(letter: LetterModel('G')),
          //   KeyboardButton(letter: LetterModel('H')),
          //   KeyboardButton(letter: LetterModel('J')),
          //   KeyboardButton(letter: LetterModel('K')),
          //   KeyboardButton(letter: LetterModel('L')),
          // ]),
          // Row(children: <Widget>[
          //   const KeyboardButton(buttonType: KeyboardButtonType.enter),
          //   KeyboardButton(letter: LetterModel('Z')),
          //   KeyboardButton(letter: LetterModel('X')),
          //   KeyboardButton(letter: LetterModel('C')),
          //   KeyboardButton(letter: LetterModel('V')),
          //   KeyboardButton(letter: LetterModel('B')),
          //   KeyboardButton(letter: LetterModel('N')),
          //   KeyboardButton(letter: LetterModel('M')),
          //   const KeyboardButton(buttonType: KeyboardButtonType.remove),
          // ]),
        ]);
  }

  // List<Widget> _genKeyboardButtonRow(KeyboardRowType type) => field.keyboard
  //     .getLettersRow(type)
  //     .map((letter) => KeyboardButton(letter))
  //     .toList();
}
