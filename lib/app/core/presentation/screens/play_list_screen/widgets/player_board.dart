import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/data/data_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/player/player_bloc.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/widgets/play_pause_button.dart';
import 'package:smoothy/app/core/presentation/screens/play_list_screen/widgets/progress_bar.dart';
import 'package:smoothy/config/app_colors.dart';

class PlayerBoard extends StatelessWidget {
  const PlayerBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<PlayerBloc, MPlayerState>(
      builder: (context, playerState) {
        return Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(15.0)),
            child: (playerState is PlayingState) ? buildPlayer(size, context, playerState) : const CircularProgressIndicator(color: AppColors.background));
      },
    );
  }

  Row buildPlayer(Size size, BuildContext context, PlayingState playerState) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: (playerState.song.isLocal)
                      ? (playerState.song.id == '-1')
                          ? Image.asset(playerState.song.cover)
                          : Image.file(File(playerState.song.cover))
                      : Image.network(playerState.song.cover))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              playerState.song.name,
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
            ),
            Text(
              playerState.song.author,
              style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4.0),
            const ProgressBar(),
            BlocBuilder<DataBloc, DataState>(
              builder: (context, dataState) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: (playerState.song.id == '-1')
                            ? null
                            : () {},
                        icon: const Icon(Icons.shuffle, color: Colors.white)),
                    IconButton(
                      onPressed: () {
                        _skipPrevious(
                          context,
                          (dataState is PlayListGetSuccessful) ? dataState : null,
                          playerState
                        );
                      },
                        icon: const Icon(Icons.skip_previous, color: Colors.white)
                    ),
                    PlayPauseButton(
                        onTap: (playerState.song.id != '-1')
                            ? () {
                              _playPause(context, playerState);
                            }
                            : null
                    ),
                    IconButton(
                      onPressed: () {
                        _skipNext(
                          context,
                          (dataState is PlayListGetSuccessful) ? dataState : null,
                          playerState
                        );
                      },
                        icon: const Icon(Icons.skip_next, color: Colors.white)
                    ),
                    IconButton(onPressed: (playerState.song.id == '-1') ? null : () {}, icon: const Icon(Icons.download, color: Colors.white)),
                  ],
                );
              },
            )
          ],
        )
      ],
    );
  }

  void _skipPrevious(BuildContext context, PlayListGetSuccessful? dataState, PlayingState playerState) {
    BlocProvider.of<PlayerBloc>(context).add(SkipPreviousEvent(
        previousSong: (playerState.currentIndex >= 1)
              ? dataState!.playList.listSong[playerState.currentIndex - 1]
              : dataState!.playList.listSong.last,
        currentIndex: (playerState.currentIndex == 0)
            ?  dataState.playList.songCount
            : playerState.currentIndex
    ));
  }

  void _skipNext(BuildContext context, PlayListGetSuccessful? dataState, PlayingState playerState) {
    BlocProvider.of<PlayerBloc>(context).add(SkipNextEvent(
        nextSong: (playerState.currentIndex < dataState!.playList.listSong.length - 1)
              ? dataState.playList.listSong[playerState.currentIndex + 1]
              : dataState.playList.listSong.first,
        currentIndex: (playerState.currentIndex == dataState.playList.songCount - 1)
            ?  -1
            : playerState.currentIndex
    ));
  }

  void _playPause(BuildContext context, PlayingState playerState) {
    BlocProvider.of<PlayerBloc>(context).add(PlayPauseEvent(state: playerState));
  }
}


