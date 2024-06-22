import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/utilis/app_text_styles.dart';

import '../../../utilis/app_colors.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BusCard extends StatelessWidget {
  String busNumber;
  List<dynamic> departureTimes;
  BusCard( this.busNumber,this.departureTimes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shadowColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus no. $busNumber',
              style: AppTextStyles.MontserratMedium(color: AppColors.primary, fontSize: 18.sp, weight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomPaint(
              size: const Size(double.infinity, 2),
              painter: DottedLinePainter(),
            ),
            const SizedBox(height: 8),
            const Text(
              'Departure times:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                for(int i=0;i<departureTimes.length;i++)
                Text(departureTimes[i]+'  ', style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 15.sp, weight: FontWeight.w500),)
              ]
            ),

          ],
        ),
      ),
    );
  }
}
