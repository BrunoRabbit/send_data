import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:send_data/bloc/counter_bloc.dart';
import 'package:send_data/model/box.dart';
import 'package:send_data/views/screen_01.dart';

class Screen02 extends StatefulWidget {
  // Give the value to the parameter to change it
  const Screen02({Key? key, required this.box}) : super(key: key);

  final Box box;

  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> {
  late CounterBloc counterBloc;
  Box box = Box(0);

  @override
  void initState() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Second screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 10),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: counterBloc,
              builder: (context, state) {
                return Text(
                  '${state.box.quantity}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return const Screen01();
                    },
                  ),
                );
              },
              child: const Text(
                'Go to screen 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: FloatingActionButton(
              heroTag: 'hero2',
              backgroundColor: Colors.purple,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(DecrementCounter(box));
              },
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            heroTag: 'hero1',
            backgroundColor: Colors.purple,
            onPressed: () {
              counterBloc.add(IncrementCounter(box));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
