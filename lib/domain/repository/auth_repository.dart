import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_challenge/core/constants/local_cache_keys.dart';
import 'package:test_challenge/core/utils/helpers.dart';

import '../../core/exceptions/failure.dart';
import '../../data/datasource/local/auth_local_data_source.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel?>> login(
      {required String username, required String password});

  Future<Either<Failure, bool>> logged();

  Future<Either<Failure, UserModel>> register(
      {required String username,
      required String password,
      required String email});
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserModel?>> login(
      {required String username, required String password}) async {
    return await runWithTryCatch(recall: () async {
      return await dataSource.login(username: username, password: password);
    });
  }

  @override
  Future<Either<Failure, UserModel>> register(
      {required String username,
      required String password,
      required String email}) async {
    return await runWithTryCatch(recall: () async {
      UserModel userModel = await dataSource.register(
          email: email, userName: username, password: password);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setInt(LocalCacheKeys.userId, userModel.idIsar);
      return userModel;
    });
  }

  @override
  Future<Either<Failure, bool>> logged() async {
    return await runWithTryCatch(recall: () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      return sharedPreferences.getInt(LocalCacheKeys.userId) != null;
    });
  }
}
