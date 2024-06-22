import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/main.dart';
import 'package:movemate/utilis/app_colors.dart';
import 'package:movemate/utilis/app_images.dart';
import 'package:movemate/utilis/app_preferences.dart';
import 'package:movemate/utilis/app_routes.dart';
import 'package:movemate/view/boarding/boarding.dart';
import 'package:movemate/view/screens/bottom_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    customizeEasyLoading();
    super.initState();
    if(preferences.getString(AppPrefs.keyId)!=null){
      Timer(const Duration(seconds: 2,),()=>Navigator.pushReplacement(context, MyRoute(const BottomScreen())));
    }
    else{
      Timer(const Duration(seconds: 2,),()=>Navigator.pushReplacement(context, MyRoute(const BoardingScreen())));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.primary,
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomLeft,
                colors: [AppColors.primary,AppColors.gradient])
          ),
          child: Center(child: Image.asset(AppImages.imgLogo,height:1.sh*0.27 ,color: AppColors.black,),)),
    );
  }

  void customizeEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 49.0
      ..textStyle = TextStyle(height: 1.5, color: AppColors.white)
      ..radius = 10.0
      ..progressColor = AppColors.white
      ..backgroundColor = AppColors.primary
      ..indicatorColor = AppColors.white
      ..textColor = AppColors.white
      ..maskColor = AppColors.white.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = true;
  }
}
