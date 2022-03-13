import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/models/word_model.dart';
import 'package:flutter_wordle_clone/widgets/cell.dart';

class Field extends StatelessWidget {
  final FieldModel field;

  const Field(this.field, {Key? key}) : super(key: key);

  //todo: cell id?
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: _genGrid(field.words),
      ),
    );
  }

  //todo: separate widget?
  List<Widget> _genGrid(Map<int, WordModel> words) {
    List<Widget> res = [];

    for (int i = 0; i < words.length; i++) {
      //todo: null safety!
      res.add(Row(children: _genRow(words[i]!)));
    }

    return res;
  }

  List<Widget> _genRow(WordModel word) {
    List<Widget> res = [];

    for (int i = 0; i < word.model.length; i++) {
      //todo: null safety!
      res.add(Cell(word.model[i]!));
    }

    return res;
  }
}
