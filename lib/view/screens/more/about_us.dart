import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
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
        title:  Text('About Us',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 19.sp, weight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us'
            ,style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            const SizedBox(height: 20.0),
            Text(
              'Movemate is a university bus tracking app designed to make commuting within the campus easier and more efficient for students. Our app leverages Google services to provide live tracking of university buses, allowing students to monitor the real-time location of buses and plan their travel accordingly.',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Features:',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600),
            ),
            SizedBox(height: 10.0),
            Text(
              '- Live Bus Tracking: Students can track university buses in real-time using our app, ensuring they never miss a bus.',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            Text(
              '- Bus Scheduling: Students can schedule buses according to their class timings and receive notifications when their scheduled bus is about to arrive.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            Text(
              '- Seat Reservation: Our app allows students to reserve seats in buses, ensuring a comfortable and hassle-free commute.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            Text(
              '- Payment Options: Students can pay for bus services on a monthly or daily basis, providing flexibility and convenience in payment.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            Text(
              '- Multiple Bus Routes: Students can view different bus routes within the campus and choose the most convenient option for their travel.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Our Mission',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            const SizedBox(height: 10.0),
            Text(
              'Our mission is to simplify campus transportation and enhance the overall commuting experience for university students. We strive to provide a reliable and user-friendly solution that meets the needs of our users.',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Contact Us',
              style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 23.sp, weight: FontWeight.w600)
            ),
            const SizedBox(height: 10.0),
            Text(
              'If you have any questions, feedback, or suggestions, please feel free to reach out to us at alihamza903978@gmail.com. We\'d love to hear from you!',
              style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 17.sp, weight: FontWeight.w100),
            ),
          ],
        ),
      ),
    );
  }
}
