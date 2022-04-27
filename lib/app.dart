import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data/bloc/counter_bloc.dart';
import 'package:send_data/views/screen_01.dart';

void application() async {
  runApp(
    const Application(),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    counterBloc = CounterBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => counterBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Screen01(),
      ),
    );
  }
}
