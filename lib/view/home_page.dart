import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc1/bloc/bloc.dart';
import 'package:multi_bloc1/bloc/events.dart';
import 'package:multi_bloc1/bloc/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("Switch");
                    return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(SwitchEvent());
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Container");
                return Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Slider");
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
