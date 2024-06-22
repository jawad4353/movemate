import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
        title:  Text('Contact Us',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 24.sp, weight: FontWeight.w600),),),

    );
  }
}
