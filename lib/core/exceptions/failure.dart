import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  static const String FETCH_DATA_FAILURE = "fetch_data_failure";
  static const String SERVER_FAILURE = "server_failure";
  static const String NETWORK_FAILURE = "network_failure";
  static const String REQUEST_FAILURE = "request_failure";
  static const String TIMEOUT_FAILURE = "timeout_failure";
  static const String CACHE_FAILURE = "cache_failure";
  static const String UNAUTHORIZED_FAILURE = "unauth_failure";
  static const String SYSTEM_FAILURE = "system_failure";
  final Map<String, dynamic>? messages;
  final Map<String, dynamic>? errors;

  const Failure(this.messages, this.errorCode, this.prefix, this.stackTrace,
      this.errors, this.customCode);

  final dynamic errorCode;
  final dynamic prefix;
  final StackTrace? stackTrace;
  final int customCode;

  @override
  List<Object> get props => [];

  String getName();

  @override
  String toString() {
    return 'Failure{messages: $messages, errors: $errors, errorCode: $errorCode, prefix: $prefix, stackTrace: $stackTrace}';
  }
}

class ServerFailure extends Failure {
  const ServerFailure(Map<String, dynamic>? messages, errorCode,
      StackTrace? stackTrace, Map<String, dynamic>? errors, int customCode)
      : super(messages, errorCode, "Server error: ", stackTrace, errors,
            customCode);

  @override
  String getName() {
    return Failure.SERVER_FAILURE;
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure(Map<String, dynamic>? messages, errorCode,
      StackTrace? stackTrace, Map<String, dynamic>? errors, int customCode)
      : super(messages, errorCode, "Network error: ", stackTrace, errors,
            customCode);

  @override
  String getName() {
    return Failure.NETWORK_FAILURE;
  }
}

class TimeOutFailure extends Failure {
  const TimeOutFailure(Map<String, dynamic>? messages, errorCode,
      StackTrace? stackTrace, Map<String, dynamic>? errors, int customCode)
      : super(messages, errorCode, "Timeout error: ", stackTrace, errors,
            customCode);

  @override
  String getName() {
    return Failure.TIMEOUT_FAILURE;
  }
}


class SystemFailure extends Failure {
  const SystemFailure(Map<String, dynamic>? messages, errorCode,
      StackTrace? stackTrace, Map<String, dynamic>? errors, int customCode)
      : super(messages, errorCode, "System error: ", stackTrace, errors,
            customCode);

  @override
  String getName() {
    return Failure.SYSTEM_FAILURE;
  }
}
