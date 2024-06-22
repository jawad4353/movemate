
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/view_model/stops_bloc/stops_bloc.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../utilis/app_text_styles.dart';
import '../home/buses.dart';

class BusStops extends StatefulWidget {
  const BusStops({Key? key}) : super(key: key);

  @override
  State<BusStops> createState() => _BusStopsState();
}

class _BusStopsState extends State<BusStops> {
  List<Color> myColors=[AppColors.green,AppColors.brown,AppColors.purple,AppColors.orange];

  @override
  void initState() {
    super.initState();
    context.read<StopsBloc>().add(StopsApiEvent(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('Bus Stops',style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 19.sp, weight: FontWeight.w500),),centerTitle: true,backgroundColor: AppColors.primary,),
      body: ListView(
        children: [
          SizedBox(height: 10.h,),
          searchBar(),
          SizedBox(height: 20.0.h,),
          stops()
        ],
      ),
    );
  }

Widget searchBar(){
    return  Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(27),
          color: AppColors.white,
          boxShadow:  [BoxShadow(color: AppColors.greyB2AFAF,spreadRadius: 0.5)]
      ),
      child: TextField(
        cursorColor: AppColors.primary,
        style:AppTextStyles.MontserratMedium(color: AppColors.greyB2AFAF, fontSize: 17.sp, weight: FontWeight.normal),
        onChanged: (a){
          context.read<StopsBloc>().add(StopSearchEvent(a));
        },
        decoration:  InputDecoration(
          contentPadding: EdgeInsets.only(top: 9.h),
          prefixIcon:  Icon(Icons.search,color:  AppColors.greyB2AFAF,),
          hintText: ' Search bus stop',
          hintStyle: AppTextStyles.MontserratMedium(color: AppColors.greyB2AFAF, fontSize: 17.h, weight: FontWeight.w400),
          border: InputBorder.none,
        ),
      ),
    ) ;
}


Widget stops(){
    return BlocBuilder<StopsBloc,StopsState>(builder: (context,state){
     if(state is StopsApiState){
       return state.myModel.isEmpty? const Center(child: Text('No Stops')):Column(children: [
         for(int i=0;i<state.myModel.length;i++)
         stopCard(color:myColors[i%myColors.length],stopId:state.myModel[i].id.toString() , stopName: state.myModel[i].stopName, lat: state.myModel[i].coordinates[0].toString(), lng: state.myModel[i].coordinates[1].toString()),
       ],);
     }
     return Center(child: CircularProgressIndicator(color: AppColors.primary,));
    });
}

  Widget stopCard({required Color color,required String stopId,required String  stopName,required String lat,required String lng  }){
    return Container(
      height: 110,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow:  [BoxShadow(color: AppColors.grey0E0F10.withOpacity(0.1),spreadRadius: 1.1,blurRadius: 0.5)]
      ),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 3),
      child: Row(
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
              SizedBox(height: 110, width:1.sw*0.95),
              Positioned(
                  left: 10,
                  top: 16,
                  child: Wrap(
                    children: [
                      Text('Stop:'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: color, fontSize: 15.0, weight: FontWeight.w500),),
                      const SizedBox(width: 3.0,),
                      Text(stopName.toUpperCase(),style: AppTextStyles.MontserratMedium(fontSize: 15.sp, weight: FontWeight.w500,color:  AppColors.primary),),
                    ],
                  )),


              Positioned(
                  top: 55,
                  left: 3,
                  right: 3,
                  child: CustomPaint(
                    painter: DottedLinePainter(),)),

              Positioned(
                bottom: 10,
                left: 8,
                child: Column(children: [
                   Text('Latitude'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: color, fontSize: 15.0, weight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Text(lat.substring(0,6),style: AppTextStyles.MontserratMedium(fontSize: 16.0, weight: FontWeight.w500,color:  AppColors.grey0E0F10.withOpacity(0.8)),)
                ],),
              )
              ,
              Positioned(
                bottom: 10,
                right: 8,
                child: Column(children: [
                  Text('Longitude'.toUpperCase(),style: AppTextStyles.MontserratMedium(color: color, fontSize: 15.0, weight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Padding(
                    padding:  const EdgeInsets.only(top: 3),
                    child: Text(lng.substring(0,6),style: AppTextStyles.MontserratMedium(fontSize: 15.0, weight: FontWeight.w500,color:  AppColors.grey0E0F10.withOpacity(0.8)),),
                  )
                ],),
              )
            ],
          )
        ],),
    );
  }



}
