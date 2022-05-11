import 'package:flutter/cupertino.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
class AppColors{
  static Color primary = const Color(0xFF25D366);
  static Color bacgroundColor = const Color(0xFFF7FEFA);
  static Color Primary2= const Color(0xFF2B344A);
  static Color Primary_Lite= const Color(0xFFECEDF1);
  static Color Primary_Dark=Color(0xFF3A3A3A);
  static Color Card_Shadow=Color(0xFF858585).withOpacity(0.2);
  static Color Background= const Color(0xFFFFFFFF);
  static Color Text_Color= const Color(0xFF2B344A);
  static Color Icon_Color= const Color(0xFF2B344A);
  static Color white= const Color(0xFFFFFFFF);
  static Color darkBackGroundColor= const Color(0xFF222f3e);
  static Color errorColor = const Color(0xFFFFD867);
}