import '../../core/failure/api_error_response.dart';

abstract class Failure implements Exception {
  Failure(this.message) : super();

  final String message;
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required String message}) : super(message);
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required String message}) : super(message);
}

class UnprocessableEntityFailure extends Failure {
  UnprocessableEntityFailure({required String message, this.error})
      : super(message);
  final ApiErrorResponse? error;
}

class InternetConnectionFailure extends Failure {
  InternetConnectionFailure({required String message}) : super(message);
}

class InternalServerFailure extends Failure {
  InternalServerFailure({required String message}) : super(message);
}

class AuthorizationFailure extends Failure {
  AuthorizationFailure({required String message}) : super(message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required String message}) : super(message);
}

class TooManyRequestFailure extends Failure {
  TooManyRequestFailure({required String message}) : super(message);
}

class PreConditionFailure extends Failure {
  PreConditionFailure({required String message}) : super(message);
}

class GeneralFailure extends Failure {
  GeneralFailure({required String message}) : super(message);
}

class ApiKeyInvalid extends Failure {
  ApiKeyInvalid({required String message}) : super(message);
}
