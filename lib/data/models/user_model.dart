import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'user_model.g.dart';

@Collection(inheritance: false)
class UserModel extends Equatable {
  Id idIsar = Isar.autoIncrement;
  final String username;
  final String email;
  final String password;

  UserModel(this.username, this.email, this.password);

  @ignore
  @override
  List<Object?> get props => [idIsar, username, email];

  @ignore
  @override
  bool? get stringify => false;
}
