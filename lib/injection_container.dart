import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smoothy/app/core/data/datasource/cache_data.dart';
import 'package:smoothy/app/core/data/datasource/local_data.dart';
import 'package:smoothy/app/core/data/datasource/remote_data.dart';
import 'package:smoothy/app/core/data/repositories/repositories_impl.dart';
import 'package:smoothy/app/core/domain/repositories/repositories.dart';
import 'package:smoothy/app/core/domain/usecases/save_song.dart';
import 'package:smoothy/core/network/network_info.dart';

final sl = GetIt.instance;


Future<void> init() async {

  // Bloc

  // usecase
  sl.registerLazySingleton(() => SaveSong(repositories: sl()));

  // repositories
  sl.registerLazySingleton<Repositories>(
      () => RepositoriesImpl(
          remoteData: sl(),
          localData: sl(),
          cacheData: sl(),
          networkInfo: sl()
      )
  );

  sl.registerLazySingleton<LocalData>(() => LocalDataImpl());
  sl.registerLazySingleton<RemoteData>(() => RemoteDataImpl(dio: sl()));
  sl.registerLazySingleton<CacheData>(() => CacheDataImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetChecker: sl()));


  final dio = Dio();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
}