import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/datasource/local/auth_local_data_source.dart';
import '../../data/models/user_model.dart';
import '../../domain/repository/auth_repository.dart';
import '../../presentation/global/auth_bloc/auth_bloc.dart';
import '../../presentation/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initIsar();
  await GetIt.instance.allReady(); //Wait till Isar inits
  initDataSource();
  initRepos();
  initBloc();
}

void initIsar() {
  try {
    sl.registerSingletonAsync<Isar>(
      () async {
        final dir = await getApplicationDocumentsDirectory();
        return Isar.getInstance('default') ??
            await Isar.open(
              [UserModelSchema],
              directory: dir.path,
            );
      },
    );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void initDataSource() {
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
}

void initRepos() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

void initBloc() {
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
}
