import 'package:flutter/material.dart';
import 'package:flutter_wordle_clone/models/enums/game_state_enum.dart';

class ResultInfoText extends StatelessWidget {
  final GameResultState result;
  final String? answer;

  const ResultInfoText(this.result, {this.answer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = _genText(result, answer);

    return Align(
        alignment: Alignment.center,
        child: Text(text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
  }

  String _genText(GameResultState result, String? answer) {
    String res = '';

    if (result == GameResultState.won) {
      res = 'YOU WON!';
    } else if (result == GameResultState.lost) {
      res = 'YOU LOST!' + (answer == null ? '' : (' - ' + answer));
    }

    return res;
  }
}
