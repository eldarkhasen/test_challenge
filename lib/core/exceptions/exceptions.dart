import 'failure.dart';

class BaseException implements Exception {
  BaseException(this.failure);

  final Failure failure;

  @override
  String toString() {
    return 'BaseException{failure: $failure}';
  }
}
///Run on entire app issues
class SystemException extends BaseException {
  SystemException(SystemFailure failure) : super(failure);
}
///Run on Server errors
class ServerException extends BaseException {
  ServerException(ServerFailure failure) : super(failure);
}
///Run on request timour
class TimeOutException extends BaseException {
  TimeOutException(TimeOutFailure failure) : super(failure);
}
///Run if something wrong with network
class NetworkException extends BaseException {
  NetworkException(NetworkFailure failure) : super(failure);
}
