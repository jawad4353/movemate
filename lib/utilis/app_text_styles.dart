
import 'package:flutter/material.dart';
import 'package:movemate/utilis/app_fonts.dart';

class AppTextStyles{


  static MontserratRegular({required Color color,required fontSize,required FontWeight weight,}){
return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily:AppFontFamilies.MontserratRegular );
}

  static MontserratBold({required Color color,required fontSize,required FontWeight weight,}){
    return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily: AppFontFamilies.MontserratBold);
  }

  static MontserratExtraBold({required Color color,required fontSize,required FontWeight weight,}){
    return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily: AppFontFamilies.MontserratExtraBold);
  }

  static MontserratSemiBold({required Color color,required fontSize,required FontWeight weight,}){
    return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily: AppFontFamilies.MontserratSemiBold);
  }

  static MontserratMedium({required Color color,required fontSize,required FontWeight weight,}){
    return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily: AppFontFamilies.MontserratMedium);
  }

}