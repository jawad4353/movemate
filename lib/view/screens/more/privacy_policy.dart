
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        backgroundColor: AppColors.primary,
        title:  Text('Privacy Policy',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 19.sp, weight: FontWeight.w600),),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            SizedBox(height: 20.0),
            Text(
              'At Movemate, we are committed to protecting the privacy and security of our users. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you use our app.',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w200),
            ),
            SizedBox(height: 20.0),
            Text(
              'Information Collection and Use',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            SizedBox(height: 10.0),
            Text(
              '- Personal Information: We may collect personal information such as your name, email address, and contact details when you register an account with us or contact us for support.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600)
            ),
            Text(
              '- Usage Data: We may collect information about how you interact with our app, including the features you use, the actions you take, and the frequency of your usage.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600)
            ),
            const SizedBox(height: 20.0),
            Text(
              'Data Usage',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            const SizedBox(height: 10.0),
            Text(
              'We use the collected information for the following purposes:',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600),
            ),
            Text(
              '- To provide and maintain our services.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600),
            ),
            Text(
              '- To improve, personalize, and enhance your experience with our app.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600),
            ),
            Text(
              '- To communicate with you and respond to your inquiries and requests.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w600),
            ),
            // Include other sections of the Privacy Policy similarly
          ],
        ),
      ),
    );
  }
}
