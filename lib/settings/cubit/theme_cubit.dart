

import 'package:base_news_app/core/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  final _prefs = GetStorage();

  void getInitialSate() {
    var value = _prefs.read(Constants.isDarkThemeEnable);
    emit(value ?? false);
  }

  void onThemeChanged(bool isDark) {
    _prefs.write(Constants.isDarkThemeEnable, isDark);
    emit(isDark);
  }
}
