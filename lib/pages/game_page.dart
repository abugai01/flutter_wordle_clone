import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/config/style.dart';
import 'package:flutter_wordle_clone/cubits/game_cubit.dart';
import 'package:flutter_wordle_clone/cubits/states/game_state.dart';
import 'package:flutter_wordle_clone/models/enums/game_state_enum.dart';
import 'package:flutter_wordle_clone/widgets/field.dart';
import 'package:flutter_wordle_clone/widgets/keyboard.dart';
import 'package:flutter_wordle_clone/widgets/result_panel.dart';
import 'package:flutter_wordle_clone/widgets/rules.dart';
import 'package:flutter_wordle_clone/widgets/show_information_window.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'WORDLE',
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
        actions: [
          IconButton(
              onPressed: () => showInformationWindow(context,
                  title: 'HOW TO PLAY', content: const Rules()),
              icon: const Icon(
                Icons.help_outline_outlined,
                color: black,
              ))
        ],
      ),
      body: BlocProvider<GameCubit>(
        create: (context) => GameCubit(),
        child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
          if (state is GameGenericState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 28),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      fieldScreenHeightFactor,
                  child: Field(state.field),
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      keyboardScreenHeightFactor,
                  child: state.field.gameResultState == GameResultState.active
                      ? Keyboard(state.field.keyboard)
                      : ResultPanel(state.field),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Sorry, something went wrong'));
          }
        }),
      ),
    );
  }
}
