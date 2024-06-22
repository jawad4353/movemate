import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            height: 35.h,
            width: 35.h,
            margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
            clipBehavior: Clip.antiAlias,
            decoration:  BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle
            ),
            child: Center(child: Icon(Icons.arrow_back_ios_outlined,color: AppColors.primary,size: 23.h,)),
          ),
        ),
        backgroundColor:AppColors.primary ,
        centerTitle: true,
        title:  Text('Notifications',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 24.sp, weight: FontWeight.w600),),),

    );
  }
}
