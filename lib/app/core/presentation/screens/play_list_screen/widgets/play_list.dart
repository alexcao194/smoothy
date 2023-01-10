import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/data/data_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/player/player_bloc.dart';
import 'package:smoothy/config/app_colors.dart';

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Playlist',
                style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
              ),
            ),
            BlocBuilder<DataBloc, DataState>(
              builder: (context, dataState) {
                if(dataState is PlayListGetSuccessful) {
                  return buildListSong(dataState);
                } else {
                  return const CircularProgressIndicator(color: AppColors.background);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Expanded buildListSong(PlayListGetSuccessful dataState) {
    return Expanded(
      child: ListView.builder(
        itemCount: dataState.playList.songCount,
        itemBuilder: (context, index) {
          return MaterialButton(
            onPressed: () {
              BlocProvider.of<PlayerBloc>(context).add(PlayEvent(song: dataState.playList.listSong[index], currentIndex: index));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 50.0, child: Image.network(dataState.playList.listSong[index].cover)),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataState.playList.listSong[index].name,
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                        ),
                        Text(
                          dataState.playList.listSong[index].author,
                          style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
