import 'package:flutter/material.dart';
import 'package:smoothy/app/core/presentation/bloc/data/data_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/player/player_bloc.dart';
import 'package:smoothy/app/core/presentation/screens/splash_screen/splash_screen.dart';
import 'package:smoothy/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PlayerBloc>()),
          BlocProvider(create: (_) => di.sl<DataBloc>())
        ],
        child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smoothy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


