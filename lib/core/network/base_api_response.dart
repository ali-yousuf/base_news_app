import 'package:equatable/equatable.dart';

abstract class BaseApiResponse extends Equatable {
  const BaseApiResponse();
  Map<String, dynamic> toMap();
  const BaseApiResponse.fromMap(Map<String, dynamic> map);
  const BaseApiResponse.fromJson(String source);
}
