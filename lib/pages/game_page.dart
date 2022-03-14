import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/cubits/field_cubit.dart';
import 'package:flutter_wordle_clone/cubits/states/field_state.dart';
import 'package:flutter_wordle_clone/widgets/field.dart';
import 'package:flutter_wordle_clone/widgets/keyboard.dart';

import '../models/enums/game_state_enum.dart';

//todo: inactive border colors!!! light grey vs bright grey
class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WORDLE'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context
                    .read<FieldCubit>()
                    .resetGame(); //todo: couldn;'t find cubit
              },
              icon: const Icon(Icons.autorenew))
        ],
      ),
      body: BlocBuilder<FieldCubit, FieldState>(builder: (context, state) {
        if (state is FieldGenericState) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //todo: separate widget!
                  SizedBox(
                      height: 40,
                      child: () {
                        if (state.field.gameState != GameState.active) {
                          return Align(
                              alignment: Alignment.center,
                              child: Text(state.field.gameState == GameState.won
                                  ? 'You won'
                                  : 'You lost, answer was ${state.field.winnerWord.toString()}'));
                        } else {
                          return null;
                        }
                      }()),
                  Field(state.field),
                  Expanded(child: Container()),
                  //todo: actually the field should be expanded
                  Keyboard(state.field),
                ]),
          );
        } else {
          return const Center(child: Text('Sorry, something went wrong'));
        }
      }),
    );
  }
}
