// COMPLETED PROJECT

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc1/bloc/bloc.dart';
import 'package:multi_bloc1/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchBloc(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
