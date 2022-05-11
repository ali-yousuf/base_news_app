import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../failure/api_error_response.dart';
import '../failure/failure.dart';

Future<T> httpCallWrapper<T>(Future<T> Function() func) async {
  try {
    return await func();
  } on DioError catch (e, st) {
    log('status code - ${e.response?.statusCode}');
    log('data -');
    log((e.response?.data).toString());
    log('stacktrace -');
    log(st.toString());
    if (e.error is SocketException) {
      throw InternetConnectionFailure(
        message: 'Please check your internet connection..',
      );
    }
    if (e.response?.statusCode == 400) {
      throw BadRequestFailure(
        message: '${e.response?.statusCode} - Please povide valid data',
      );
    } else if (e.response?.statusCode == 404) {
      throw NotFoundFailure(message: '404 Not Found');
    } else if (e.response?.statusCode == 401) {
      throw AuthenticationFailure(
          message: '${e.response?.statusCode} - Please login first!');
    } else if (e.response?.statusCode == 403) {
      throw AuthorizationFailure(
          message: '${e.response?.statusCode} - Unauthorized');
    } else if (e.response?.statusCode == 422) {
      final response = ApiErrorResponse.fromMap(e.response!.data);
      throw UnprocessableEntityFailure(
        error: response,
        message: '${e.response?.statusCode} - ${response.getErrorValue()}',
      );
    } else if (e.response?.statusCode == 429) {
      throw TooManyRequestFailure(
        message:
            '${e.response?.statusCode} - Too many request, Please try again after some time!',
      );
    } else if (e.response?.statusCode == 412) {
      throw PreConditionFailure(
        message:
            '${e.response?.statusCode} - Doctor might not be available to join the conference',
      );
    } else {
      throw InternalServerFailure(
        message:
            '${e.response?.statusCode} - Internal Server Error, Please try again later',
      );
    }
  } on FormatException catch (e, st) {
    log(e.toString());
    log(st.toString());
    throw GeneralFailure(
      message: 'Something went wrong during formatting data.',
    );
  } on SocketException {
    throw InternetConnectionFailure(message: 'Check your internet connection.');
  }
}

Future<T> asyncFunctionWrapper<T>(
    BuildContext context, Future<T> Function() func) async {
  try {
    return await func();
  } catch (e) {
    if (e is Failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      if (e is AuthenticationFailure) {
        // context.read<AuthenticationNotifier>().logout();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
    rethrow;
  }
}
