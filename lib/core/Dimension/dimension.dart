import 'package:flutter/material.dart';

import '../constants.dart';

class Dimension{
  static bool isScaled =false;
  static double Padding =16.0;
  static double Text_Size_Big =16.0;
  static double Size_2 =2.0;
  static double Size_3 =3.0;
  static double Size_4 =4.0;
  static double Size_5 =5.0;
  static double Size_6 =6.0;
  static double Size_8 =8.0;
  static double Size_9=9.0;
  static double Size_10 =10.0;
  static double Size_12 =12.0;
  static double Size_13 =13.0;
  static double Size_14 =14.0;
  static double Size_15 =15.0;
  static double Size_16 =16.0;
  static double Size_17 =17.0;
  static double Size_18 =18.0;
  static double Size_20 =20.0;
  static double Size_22 =22.0;
  static double Size_24 =24.0;
  static double Size_26 =26.0;
  static double Size_28 =28.0;
  static double Size_30 =30.0;
  static double Size_32 =32.0;
  static double Size_34 =34.0;
  static double Size_36 =36.0;
  static double Size_38 =38.0;
  static double Size_40 =40.0;
  static double Size_42 =42.0;
  static double Size_44 =44.0;
  static double Size_46 =46.0;
  static double Size_48 =48.0;
  static double Size_50 =50.0;
  static double Size_52 =52.0;
  static double Size_54 =54.0;
  static double Size_56 =56.0;
  static double Size_58 =58.0;
  static double Size_60 =60.0;
  static double Text_Size =14.0;
  static double Text_Size_Small =12.0;
  static double Text_Size_Small_Extra =10.0;
  static double card_elevation =Dimension.Size_2;
  static double curve_height =100;

  static int Alpha =150;
  static FontWeight textMedium=FontWeight.w500;
  static FontWeight textBold=FontWeight.w700;
  static FontWeight semiBold=FontWeight.w600;
  static FontWeight textExtraBold=FontWeight.w800;
  static FontWeight textNormal=FontWeight.w400;

  static double Size_100=100.0;
  static double Size_150=150.0;
  static double Size_62=62.0;
  static double Size_64=64.0;
  static double Size_66=66.0;
  static double Size_68=68.0;
  static double Size_70=70.0;
  static double Size_72=72.0;
  static double? paddingTop,appbarHeight,screenRatio,paddingBottom,appWidth,appHeight;
  
  static setSize(BuildContext context){
    paddingTop=MediaQuery.of(context).padding.top;
    paddingBottom=MediaQuery.of(context).padding.bottom;
    appWidth=MediaQuery.of(context).size.width;
    appHeight=MediaQuery.of(context).size.height;
    screenRatio=appWidth!/Constants.defaultScreenSize.width;
    appbarHeight=AppBar().preferredSize.height;
  }

  static void scaleSize({Function? then}){
    if(!isScaled) {
      isScaled = true;
      Padding *= screenRatio!;
      Text_Size_Big *= screenRatio!;
      Size_2 *= screenRatio!;
      Size_3 *= screenRatio!;
      Size_4 *= screenRatio!;
      Size_5 *= screenRatio!;
      Size_6 *= screenRatio!;
      Size_8 *= screenRatio!;
      Size_9 *= screenRatio!;
      Size_10 *= screenRatio!;
      Size_12 *= screenRatio!;
      Size_13 *= screenRatio!;
      Size_14 *= screenRatio!;
      Size_15 *= screenRatio!;
      Size_16 *= screenRatio!;
      Size_17 *= screenRatio!;
      Size_18 *= screenRatio!;
      Size_20 *= screenRatio!;
      Size_22 *= screenRatio!;
      Size_24 *= screenRatio!;
      Size_26 *= screenRatio!;
      Size_28 *= screenRatio!;
      Size_30 *= screenRatio!;
      Size_32 *= screenRatio!;
      Size_34 *= screenRatio!;
      Size_36 *= screenRatio!;
      Size_38 *= screenRatio!;
      Size_40 *= screenRatio!;
      Size_42 *= screenRatio!;
      Size_44 *= screenRatio!;
      Size_46 *= screenRatio!;
      Size_48 *= screenRatio!;
      Size_50 *= screenRatio!;
      Size_52 *= screenRatio!;
      Size_54 *= screenRatio!;
      Size_56 *= screenRatio!;
      Size_58 *= screenRatio!;
      Size_60 *= screenRatio!;
      Text_Size *= screenRatio!;
      Text_Size_Small *= screenRatio!;
      Text_Size_Small_Extra *= screenRatio!;
      card_elevation *= screenRatio!;
      curve_height *= screenRatio!;

      Size_100 *= screenRatio!;
      Size_150 *= screenRatio!;
      Size_62 *= screenRatio!;
      Size_64 *= screenRatio!;
      Size_66 *= screenRatio!;
      Size_68 *= screenRatio!;
      Size_70 *= screenRatio!;
      Size_72 *= screenRatio!;
      if (then != null) {
        then();
      }
    }
  }

}