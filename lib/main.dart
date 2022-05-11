import 'dart:async';
import 'dart:developer';

import 'package:base_news_app/core/base_news_app.dart';
import 'package:base_news_app/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helpers.dart';

void main() {
  runZonedGuarded(
    () async {
      BlocOverrides.runZoned(() async {
        setup();
        runApp(const BaseNewsApp());
      }, blocObserver: AppBlocObserver());
    },
    (error, stackTrace) async {
      log('runzoned error');
      log(error.runtimeType.toString());
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
