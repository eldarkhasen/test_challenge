import 'package:isar/isar.dart';

import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> login({required String username, required String password});

  Future<UserModel> register(
      {required String email,
      required String userName,
      required String password});
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Isar isar;

  AuthLocalDataSourceImpl(this.isar);

  @override
  Future<UserModel?> login(
      {required String username, required String password}) async {
    List<UserModel> users = await isar.userModels
        .where()
        .filter()
        .usernameEqualTo(username)
        .and()
        .passwordEqualTo(password)
        .findAll();
    return users.isNotEmpty ? users.first : null;
  }

  @override
  Future<UserModel> register(
      {required String email,
      required String userName,
      required String password}) async {
    final UserModel user = UserModel(userName, email, password);
    Id id = await isar.writeTxn(() => isar.userModels.put(user));
    user.idIsar = id;
    return user;
  }
}