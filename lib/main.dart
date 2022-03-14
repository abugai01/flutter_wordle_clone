import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wordle_clone/cubits/field_cubit.dart';
import 'package:flutter_wordle_clone/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

//todo: animation of cells on clicking enter

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Wordle Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //todo: rename to game cubit!
      home: BlocProvider<FieldCubit>(
        create: (context) => FieldCubit(),
        child: const GamePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
