import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/utilis/app_routes.dart';
import 'package:movemate/view/screens/routes/route_details.dart';
import 'package:movemate/view_model/routes_bloc/routes_bloc.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';
import '../home/buses.dart';

class BusRoutes extends StatefulWidget {
  const BusRoutes({Key? key}) : super(key: key);

  @override
  State<BusRoutes> createState() => _BusRoutesState();
}

class _BusRoutesState extends State<BusRoutes> {
  List<Color> myColors=[AppColors.green,AppColors.brown,AppColors.purple,AppColors.orange];

  @override
  void initState() {
    super.initState();
    context.read<RoutesBloc>().add(RoutesApiEvent(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('Bus Routes',style: AppTextStyles.MontserratMedium(color: AppColors.white, fontSize: 19.sp, weight: FontWeight.w500),),centerTitle: true,backgroundColor: AppColors.primary,),
      body: ListView(
        children: [
          SizedBox(height: 10.h,),
          searchBar(),
          SizedBox(height: 20.0.h,),
          routes()
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
          context.read<RoutesBloc>().add(RouteSearchEvent(a));
        },
        decoration:  InputDecoration(
          contentPadding: EdgeInsets.only(top: 9.h),
          prefixIcon:  Icon(Icons.search,color:  AppColors.greyB2AFAF,),
          hintText: ' Search bus route',
          hintStyle: AppTextStyles.MontserratMedium(color: AppColors.greyB2AFAF, fontSize: 17.h, weight: FontWeight.w400),
          border: InputBorder.none,
        ),
      ),
    ) ;
  }


  Widget routes(){
    return BlocBuilder<RoutesBloc,RouteState>(builder: (context,state){
      if(state is RouteApiState){
       return Column(children: [
         for(int i=0;i<state.myModel.length;i++)
         InkWell(
             onTap: (){
               Navigator.push(context, MyRoute(RouteDetails(state.myModel[i],myColors[i%myColors.length])));
             },
             child: routeCard(routeName: state.myModel[i].name??'',startingPoint:state.myModel[i].startingPoint??'' ,endingPoint: state.myModel[i].endingPoint??'', color: myColors[i%myColors.length]))
       ],);
      }
      return Center(child: CircularProgressIndicator(color: AppColors.primary,));
    });
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


}
