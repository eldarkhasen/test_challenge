import 'failure.dart';

class BaseException implements Exception {
  BaseException(this.failure);

  final Failure failure;

  @override
  String toString() {
    return 'BaseException{failure: $failure}';
  }
}

class FetchDataException extends BaseException {
  FetchDataException(FetchDataFailure failure) : super(failure);
}

class BadRequestException extends BaseException {
  BadRequestException(RequestFailure failure) : super(failure);
}

class UnauthorizedException extends BaseException {
  UnauthorizedException(UnauthorizedFailure failure) : super(failure);
}

class SystemException extends BaseException {
  SystemException(SystemFailure failure) : super(failure);
}

class ServerException extends BaseException {
  ServerException(ServerFailure failure) : super(failure);
}

class TimeOutException extends BaseException {
  TimeOutException(TimeOutFailure failure) : super(failure);
}

class NetworkException extends BaseException {
  NetworkException(NetworkFailure failure) : super(failure);
}

class PaymentException extends BaseException {
  PaymentException(super.failure);
}
