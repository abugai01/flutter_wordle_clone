import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/cubits/game_cubit.dart';
import 'package:flutter_wordle_clone/models/field_model.dart';
import 'package:flutter_wordle_clone/widgets/custom_button.dart';
import 'package:flutter_wordle_clone/widgets/result_info_text.dart';

class ResultPanel extends StatelessWidget {
  final FieldModel field;

  const ResultPanel(this.field, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ResultInfoText(field.gameResultState,
              answer: field.winnerWord.toString()),
          const SizedBox(height: 18),
          Row(children: <Widget>[
            Expanded(child: Container()),
            CustomButton(
              'STATS',
              function: () {
                // TODO: implement!
              },
              color: darkGrey,
            ),
            const SizedBox(width: 15),
            CustomButton(
              'NEW GAME',
              function: () {
                context.read<GameCubit>().newGame();
              },
              color: green,
            ),
            Expanded(child: Container()),
          ]),
        ]);
  }
}
