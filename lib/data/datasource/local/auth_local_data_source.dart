import 'package:isar/isar.dart';
import '/core/exceptions/failure.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  ///Login user
  Future<UserModel?> login(
      {required String username, required String password});

  ///Register user
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
    List<UserModel> users = await isar.userModels
        .where()
        .filter()
        .usernameEqualTo(userName)
        .and()
        .emailEqualTo(email)
        .findAll();
    ///Check if user already exists
    if (users.isNotEmpty) {
      throw SystemException(const SystemFailure({
        "error": ["User already exists"]
      }, 500, null, null, 2000));
    }
    Id id = await isar.writeTxn(() => isar.userModels.put(user));
    user.idIsar = id;
    ///return user with ID to store it in local storage
    return user;
  }
}
