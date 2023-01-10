import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/data/data_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/player/player_bloc.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/play_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Color(0xFFFC5C7D),
                Color(0xFF6A82FB),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 90.0),
          child: const Icon(Icons.flutter_dash)
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlayerBloc>(context).add(const GetFromCacheEvent());
    BlocProvider.of<DataBloc>(context).add(const GetPlayListEvent(id: '01'));
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlayListScreen()));
    });
  }
}
