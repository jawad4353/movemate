import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class LiveTrack extends StatefulWidget {
  const LiveTrack({Key? key}) : super(key: key);

  @override
  State<LiveTrack> createState() => _LiveTrackState();
}

class _LiveTrackState extends State<LiveTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:AppColors.primary ,
        centerTitle: true,
        title:  Text('Live Tracking',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 24.sp, weight: FontWeight.w600),),),
      body: const Center(child: Text('live track')),
    );
  }
}
