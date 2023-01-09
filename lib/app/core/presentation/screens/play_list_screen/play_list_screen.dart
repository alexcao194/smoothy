import 'package:flutter/material.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/widgets/play_list.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/widgets/player_board.dart';
import 'package:smoothy/config/app_colors.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                PlayerBoard(),
                Expanded(
                  child: PlayList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}