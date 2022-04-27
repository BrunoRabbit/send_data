import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data/bloc/counter_bloc.dart';
import 'package:send_data/model/box.dart';
import 'package:send_data/views/screen_02.dart';

class Screen01 extends StatefulWidget {
  const Screen01({Key? key}) : super(key: key);

  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
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
        title: const Text('First screen'),
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
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return Screen02(box: box);
                    },
                  ),
                );
              },
              child: const Text(
                'Go to screen 2',
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
              heroTag: 'hero1',
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(DecrementCounter(box));
              },
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            heroTag: 'hero2',
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
