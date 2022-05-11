import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiErrorResponse extends Equatable {
  final String message;

  const ApiErrorResponse({
    required this.message,
  });

  ApiErrorResponse copyWith({
    String? message,
  }) {
    return ApiErrorResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory ApiErrorResponse.fromMap(Map<String, dynamic> map) {
    return ApiErrorResponse(
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiErrorResponse.fromJson(String source) =>
      ApiErrorResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ApiErrorResponse(message: $message)';

  @override
  List<Object> get props => [message];
}
