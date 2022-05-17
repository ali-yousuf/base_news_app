

import 'package:base_news_app/core/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(bool isDark) : super(isDark);

  void onThemeChanged(bool isDark) {
    final _prefs = GetStorage();
    _prefs.write(Constants.isDarkThemeEnable, isDark);
    emit(isDark);
  }
}
