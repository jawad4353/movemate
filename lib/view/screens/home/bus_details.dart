import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../model/buses_model.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';

class BusDetails extends StatefulWidget {
  final Bus myModel;
  const BusDetails(this.myModel,{Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
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
        title:  Text('Bus Details',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 24.sp, weight: FontWeight.w600),),),

      body: ListView(
        children: [
          const SizedBox(height: 5,),
          Text("Bus number ${widget.myModel.license.toUpperCase()}",style:AppTextStyles.MontserratSemiBold(color: AppColors.green, fontSize: 20.sp, weight: FontWeight.w600),textAlign: TextAlign.center,),
          schedules(),
          const SizedBox(height: 5,),
          stops()
        ],
      ),
    );

  }


  Widget schedules(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columnSpacing: 14,
          showCheckboxColumn: true,
          dividerThickness: 3.0,
          headingRowColor: MaterialStateProperty.resolveWith((states) => AppColors.primary),
          clipBehavior: Clip.antiAlias,
          border: TableBorder(borderRadius: BorderRadius.circular(5),

          ),
          columns:  [
            DataColumn(label: Text('Departure Time'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500))),
            DataColumn(label: Text('Departure Friday'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500))),
          ],
          rows: List.generate(
            // Assuming both lists have the same length
            widget.myModel.departureTimes.length,
                (index) => DataRow(
              cells: [
                DataCell(Text(widget.myModel.departureTimes[index],style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
                DataCell(Text(widget.myModel.fridayDepartureTimes[index],style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stops(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DataTable(
          columnSpacing: 14,
          showCheckboxColumn: true,
          dividerThickness: 3.0,
          headingRowColor: MaterialStateProperty.resolveWith((states) => AppColors.primary),
          clipBehavior: Clip.antiAlias,
          border: TableBorder(borderRadius: BorderRadius.circular(5),

          ),
          columns:  [
            DataColumn(label: Text('Stops'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500))),
          ],
          rows: List.generate(
            // Assuming both lists have the same length
            widget.myModel.stops.length,
                (index) => DataRow(
              cells: [
                DataCell(Text(widget.myModel.stops[index].toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
