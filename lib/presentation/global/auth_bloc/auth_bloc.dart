import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AppStarted) {
        final response = await authRepository.logged();
        response.fold((l) => emit(Unauthorized()), (r){
          if(r){
            emit(Authorized());
          }else{
            emit(Unauthorized());
          }
        });
      } else if (event is LoggedIn) {
        emit(Authorized());
      } else if (event is LoggedOut) {
        emit(Unauthorized());
      }
    });
  }
}
