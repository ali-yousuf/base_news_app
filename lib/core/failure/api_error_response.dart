import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiErrorResponse extends Equatable {
  final String message;
  final Map<String, List<dynamic>?> errors;

  const ApiErrorResponse({
    required this.message,
    required this.errors,
  });

  String? getErrorValueByKey({required String key}) {
    return errors[key]?.first;
  }

  String? getErrorValue() {
    return errors[errors.keys.first]?.first;
  }

  ApiErrorResponse copyWith({
    String? message,
    Map<String, List<dynamic>?>? errors,
  }) {
    return ApiErrorResponse(
      message: message ?? this.message,
      errors: errors ?? this.errors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'errors': errors,
    };
  }

  factory ApiErrorResponse.fromMap(Map<String, dynamic> map) {
    return ApiErrorResponse(
      message: map['message'] ?? '',
      errors: Map<String, List<dynamic>?>.from(map['errors']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiErrorResponse.fromJson(String source) =>
      ApiErrorResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ApiErrorResponse(message: $message, errors: $errors)';

  @override
  List<Object> get props => [message, errors];
}
