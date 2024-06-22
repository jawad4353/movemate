import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import '../../utilis/app_routes.dart';
import '../../utilis/app_text_styles.dart';
import '../auth/login.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  var selected;
  @override
  Widget build(BuildContext context) {
    print(AppColors.primary.value.toRadixString(16).padLeft(8, '0'));
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:  AppColors.primary,
        body: Stack(children: [
          SizedBox(height: 1.sh,width: 1.sw,),

          Positioned(
              top: 1.sh*0.04,
              left: 0,
              right: 0,
              child: body()),

          Positioned(
              bottom: 25.h,
              left: 25.w,
              child: _btnSkip()),
          Positioned(
              bottom: 25.h,
              right: 25.w,
              child: _btnNext())
        ],),
      ),
    );
  }


  Widget body(){
    return Container(
      width: 1.sw*0.8,
      margin:EdgeInsets.symmetric(horizontal: 26.w),
      child: Column(children: [
        Text('“Track Bus With Ease”',style:  AppTextStyles.MontserratSemiBold(
          color: AppColors.white,
          fontSize: 28.sp,
          weight: FontWeight.w500,
        )),
        SizedBox(height: 50.h,),
        Image.asset(AppImages.imgBoarding,height: 1.sh*0.4,),
        SizedBox(height: 50.h,),

        Text('"Say goodbye to manual processes. Simplify bus tracking, save time, and efforts."',style: AppTextStyles.MontserratSemiBold(
          color: AppColors.white,
          fontSize: 17.sp,
          weight: FontWeight.w500,
        ),textAlign: TextAlign.center,),
        const SizedBox(height: 5,),
       ])
    );
  }


  Widget _btnSkip(){
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(context, MyRoute(Login()));
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: Image.asset(AppImages.iconSkip).image,fit: BoxFit.cover)
        ),
        child:  Center(
          child: Text('Skip',style:  AppTextStyles.MontserratSemiBold(
            color: AppColors.primary,
            fontSize: 15.sp,
            weight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }

  Widget _btnNext(){
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(context, MyRoute(Login()));
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: Image.asset(AppImages.iconSkip).image,fit: BoxFit.cover)
        ),
        child:  Center(
          child: Text('Next',style:  AppTextStyles.MontserratSemiBold(
            color: AppColors.primary,
            fontSize: 15.sp,
            weight: FontWeight.w500,
          ),),
        ),
      ),
    );
  }
}
