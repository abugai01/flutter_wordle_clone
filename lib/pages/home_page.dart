import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/cubits/field_cubit.dart';
import 'package:flutter_wordle_clone/cubits/states/field_state.dart';
import 'package:flutter_wordle_clone/widgets/field.dart';
import 'package:flutter_wordle_clone/widgets/keyboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WORDLE'),
        actions: [
          IconButton(
              onPressed: () {
                //todo: implement
              },
              icon: const Icon(Icons.autorenew))
        ],
      ),
      body: BlocProvider<FieldCubit>(
        create: (context) => FieldCubit(),
        child: BlocBuilder<FieldCubit, FieldState>(builder: (context, state) {
          if (state is FieldGenericState) {
            return Column(children: <Widget>[
              Field(state.field),
              Keyboard(state.field),
            ]);
          } else {
            return const Center(child: Text('Sorry, something went wrong'));
          }
        }),
      ),
    );
  }
}
