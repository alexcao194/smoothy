import 'package:flutter/material.dart';
import 'package:smoothy/injection_container.dart' as di;

import 'app/core/presentation/screens/play_list_screen/play_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    // MultiBlocProvider(
    //     providers: [
    //     ],
    //     child: const MyApp())
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayListScreen(),
    );
  }
}


