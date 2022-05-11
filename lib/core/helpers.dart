export 'helpers/app_bloc_observer.dart';
export 'helpers/async_function_wrapper.dart';

import 'package:base_news_app/core/constants.dart';
import 'package:base_news_app/core/failure/failure.dart';
import 'package:base_news_app/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';

Future<void> handleError(Object error) async {
  if (navigatorKey.currentContext != null) {
    if (error is Failure) {
      CustomDialog.showToast(
        navigatorKey.currentContext!,
        error.message,
        isError: true,
      );
    } else {
      CustomDialog.showToast(
        navigatorKey.currentContext!,
        'Something went wrong! Please try again',
        isError: true,
      );
    }
  }
}

class CustomDialog {
  CustomDialog._();

  static Future<T?> showBottomSheet<T>(BuildContext context, Widget child) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static Future<T?> showCustomDialog<T>(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  static Future<T?> showToast<T>(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Flash(
            controller: controller,
            position: FlashPosition.bottom,
            behavior: FlashBehavior.floating,
            margin: const EdgeInsets.only(bottom: 80),
            borderRadius: BorderRadius.circular(31),
            useSafeArea: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isError ? AppColors.errorColor : AppColors.primary,
                      ),
                      child: Center(
                          child: isError
                              ? const Icon(Icons.warning)
                              : const Icon(Icons.done)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
