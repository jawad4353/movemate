import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movemate/model/RouteModel.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';
import '../home/buses.dart';

class RouteDetails extends StatefulWidget {
  final BusRouteModel myModel;
  final Color color;
  const RouteDetails( this.myModel,this.color, {Key? key}) : super(key: key);
  @override
  State<RouteDetails> createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
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
        title:  Text('Route Details',style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 24.sp, weight: FontWeight.w600),),),

      body: ListView(
        children: [
          routeCard(color:widget.color,routeName:widget.myModel.name,startingPoint: widget.myModel.startingPoint,endingPoint: widget.myModel.endingPoint ),
         const SizedBox(height: 5,),
          Text('\n   Schedule',style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 21.sp, weight: FontWeight.w600),),
          const SizedBox(height: 5,),
          schedules(),
          const SizedBox(height: 5,),
          Text('\n   Stops',style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 21.sp, weight: FontWeight.w600),),
          const SizedBox(height: 5,),
          stops(),
          const SizedBox(height: 25,),
        ],
      )
    );
  }



  Widget routeCard( {required Color color,required String routeName,required String  startingPoint,required String endingPoint }){
    return Container(
      height: 130,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow:  [BoxShadow(color: AppColors.grey0E0F10.withOpacity(0.1),spreadRadius: 1.1,blurRadius: 0.5)]
      ),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 3),
      child: Column(
        children: [
          Container(
            width: 7,
            decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25)
            ),
          ),

          Stack(
            children: [
              SizedBox(height: 130, width:1.sw*0.95),
              Positioned(
                  left: 10,
                  top: 16,
                  child: Wrap(
                    children: [
                      Text('Route:',style: AppTextStyles.MontserratMedium(color: color, fontSize: 16.0, weight: FontWeight.w500),),
                      const SizedBox(width: 3.0,),
                      Text(routeName.toUpperCase(),style: AppTextStyles.MontserratMedium(fontSize: 16.sp, weight: FontWeight.w500,color:  AppColors.primary),),
                    ],
                  )),


              Positioned(
                  top: 55,
                  left: 3,
                  right: 3,
                  child: CustomPaint(
                    painter: DottedLinePainter(),)),

              Positioned(
                bottom: 40,
                left: 8,
                child: Wrap(children: [
                  Text('Start from: ',style: AppTextStyles.MontserratMedium(color: color, fontSize: 16.0, weight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(startingPoint.toUpperCase(),style: AppTextStyles.MontserratMedium(fontSize: 17.0, weight: FontWeight.w500,color:  AppColors.grey0E0F10.withOpacity(0.8)),)
                ],),
              )
              ,
              Positioned(
                bottom: 10,
                left: 8,
                child: Wrap(children: [
                  Text('Ends at: ',style: AppTextStyles.MontserratMedium(color: color, fontSize: 16.0, weight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Padding(
                    padding:  const EdgeInsets.only(top: 3),
                    child: Text(endingPoint.toUpperCase(),style: AppTextStyles.MontserratMedium(fontSize: 17.0, weight: FontWeight.w500,color:  AppColors.grey0E0F10.withOpacity(0.8)),),
                  )
                ],),
              )
            ],
          )
        ],),
    );
  }

  Widget schedules(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
          DataColumn(label: Text('Departure Time Friday'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500))),
        ],
        rows: List.generate(
          // Assuming both lists have the same length
          widget.myModel.schedule.departureTimes.length,
              (index) => DataRow(
            cells: [
              DataCell(Text(convertTime(widget.myModel.schedule.departureTimes[index],),style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
              DataCell(Text( convertTime(widget.myModel.schedule.fridayDepartureTimes[index]),style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
            ],
          ),
        ),
      ),
    );
  }


  Widget stops(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.resolveWith((states) => AppColors.primary),
        clipBehavior: Clip.antiAlias,
        border: TableBorder(borderRadius: BorderRadius.circular(5),

        ),
        columns:  [
          DataColumn(label: Text('Stop ID'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500),)),
          DataColumn(label: Text('Stop Name'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w500))),
        ],
        rows: List.generate(
          // Assuming both lists have the same length
          widget.myModel.stops.length,
              (index) => DataRow(
            cells: [
              DataCell(Text(widget.myModel.stops[index].id,style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
              DataCell(Text( widget.myModel.stops[index].stopName.toUpperCase(),style: AppTextStyles.MontserratMedium(color: AppColors.black0E0F10, fontSize: 16.sp, weight: FontWeight.w500))),
            ],
          ),
        ),
      ),
    );
  }

  String convertTime(input){
    DateTime utcDateTime = DateTime.parse(input.toString());
    DateTime pakistanDateTime = utcDateTime.toLocal();
    String formattedDateTime = DateFormat.yMd().add_jm().format(pakistanDateTime);
    return formattedDateTime;
  }
}
