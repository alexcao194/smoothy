import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothy/app/core/data/datasource/cache_data.dart';
import 'package:smoothy/app/core/data/datasource/local_data.dart';
import 'package:smoothy/app/core/data/datasource/remote_data.dart';
import 'package:smoothy/app/core/data/repositories/repositories_impl.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/app/core/domain/usecases/cache_song.dart';
import 'package:smoothy/app/core/domain/usecases/get_play_list.dart';
import 'package:smoothy/app/core/domain/usecases/get_song_from_cache.dart';
import 'package:smoothy/app/core/presentation/bloc/data/data_bloc.dart';
import 'package:smoothy/app/core/presentation/bloc/player/player_bloc.dart';
import 'package:smoothy/core/network/network_info.dart';
import 'package:smoothy/core/services/audio_player/audio_player.dart';
import 'package:smoothy/core/services/sorter/song_sorter/song_sorter.dart';

final sl = GetIt.instance;


Future<void> init() async {

  // Bloc
  sl.registerFactory(() => PlayerBloc(
    audioPlayer: sl(),
    getSongFromCache: sl(),
    cacheSong: sl()
  ));
  sl.registerFactory(() => DataBloc(getPlayList: sl()));

  // usecase
  sl.registerLazySingleton(() => CacheSong(repositories: sl()));
  sl.registerLazySingleton(() => GetSongFromCache(repositories: sl()));
  sl.registerLazySingleton(() => GetPlayList(repositories: sl()));

  // repositories
  sl.registerLazySingleton<Repositories>(
      () => RepositoriesImpl(
          songSorter: sl(),
          remoteData: sl(),
          localData: sl(),
          cacheData: sl(),
          networkInfo: sl()
      )
  );

  // dependency
  sl.registerLazySingleton<LocalData>(() => LocalDataImpl());
  sl.registerLazySingleton<RemoteData>(() => RemoteDataImpl(dio: sl()));
  sl.registerLazySingleton<CacheData>(() => CacheDataImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetChecker: sl()));
  sl.registerLazySingleton<SongSorter>(() => NoneSorter());
  sl.registerLazySingleton<AudioPlayer>(() => AudioPlayerImpl());

  // third-party service
  final dio = Dio();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
}