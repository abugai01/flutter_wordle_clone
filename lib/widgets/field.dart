import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/models/letter_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';
import 'package:flutter_wordle_clone/widgets/cell.dart';

class Field extends StatelessWidget {
  final FieldModel field;

  const Field(this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(child: Container()),
        Column(children: _genGrid(field.words)),
        Expanded(child: Container()),
      ]),
    );
  }

  List<Widget> _genGrid(Map<int, WordModel> words) {
    List<Widget> res = [];

    for (WordModel word in words.values) {
      res.add(Row(children: _genRow(word)));
    }

    return res;
  }

  List<Widget> _genRow(WordModel word) {
    List<Widget> res = [];

    for (LetterModel letter in word.model.values) {
      res.add(Cell(letter));
    }

    return res;
  }
}
