import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/main.dart';
import 'package:movemate/utilis/app_preferences.dart';
import 'package:movemate/utilis/app_routes.dart';
import 'package:movemate/utilis/app_text_styles.dart';
import 'package:movemate/view/screens/home/slider.dart';
import 'package:movemate/view/screens/more/about_us.dart';
import 'package:movemate/view/screens/more/change_password.dart';
import 'package:movemate/view/screens/more/privacy_policy.dart';
import 'package:movemate/view_model/buses_bloc/buses_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/routes_bloc/routes_bloc.dart';
import '../../../view_model/stops_bloc/stops_bloc.dart';
import '../../../widgets/dialogues/logout.dart';
import '../../auth/login.dart';
import 'bus_details.dart';
import 'buses.dart';
import 'notifications.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Color> myColors=[AppColors.green,AppColors.brown,AppColors.black,AppColors.primary,AppColors.orange,AppColors.purple];

  @override
  void initState() {
    super.initState();
    context.read<BusesBloc>().add(BusesApiEvent(context));
    context.read<RoutesBloc>().add(RoutesApiEvent(context));
    context.read<StopsBloc>().add(StopsApiEvent(context));

  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            _scaffoldKey.currentState?.openDrawer();
          },icon: Image.asset(AppImages.iconDrawer,color: AppColors.primary,height: 38.h,),),
          iconTheme: IconThemeData(color: AppColors.primary,size: 30),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          title:Container(
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(27),
                color: AppColors.white,
                boxShadow:  [BoxShadow(color: AppColors.greyB2AFAF,spreadRadius: 0.5)]
            ),
            child: TextField(
              cursorColor: AppColors.primary,
              style:AppTextStyles.MontserratMedium(color: AppColors.greyB2AFAF, fontSize: 13.sp, weight: FontWeight.normal),
      
              onChanged: (a){
                context.read<BusesBloc>().add(BusSearchEvent(a));
              },
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.only(top: 9.h),
                prefixIcon:  Icon(Icons.search,color:  AppColors.greyB2AFAF,),
                hintText: ' Search bus',
                hintStyle: AppTextStyles.MontserratMedium(color: AppColors.greyB2AFAF, fontSize: 13.h, weight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          ) ,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MyRoute(const Notifications()));
            }, icon:Image.asset(AppImages.iconNotifications,color: AppColors.primary,height: 28.h,)),
          ],
        ),
        drawer:  Drawer(
          backgroundColor: AppColors.white,
          child:  Container(
            color: AppColors.white,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: AppColors.primary ),
                    currentAccountPicture: Container(
                        height: 120.h,
                        width: 120.h,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          image: DecorationImage(image: Image.asset(AppImages.imgProfile).image,fit: BoxFit.cover,),
                        ),
                      ),
                        accountName:  Text(preferences.getString(AppPrefs.keyId)??"",style:AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 18.sp, weight: FontWeight.w600)), accountEmail:  Text(preferences.getString(AppPrefs.keyEmail)??"",style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 16.sp, weight: FontWeight.w400),)),
                _buttons(icon: AppImages.iconPassword,text: 'Change Password'),
                _buttons(icon: AppImages.iconShareApp,text: 'Share App'),
                _buttons(icon: AppImages.iconAboutUs,text: 'About Us'),
                _buttons(icon:AppImages.iconPrivacyPolicy,text: 'Privacy Policy'),
                _buttons(icon: AppImages.iconLogOut,text: 'Logout'),
      
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text('version 1.0  ',style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),),
                )
      
              ],
            ),
          ),
        ),
      
        body: ListView(children:  [
          const MySlider(),
          Text('\n   Features',style:AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 24.sp, weight: FontWeight.w600),),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 6.h),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 BlocBuilder<RoutesBloc,RouteState>(
                   builder: (context,state) {
                     if(state is RouteApiState){
                       return valueContainers(title: 'Total Routes', result: state.myModel.length<10 ? "0${state.myModel.length}":state.myModel.length.toString(), color: AppColors.green,);
                     }
                     return  valueContainers(title: 'Total Routes', result: '_', color: AppColors.green,);
                   }
                 ),


                 BlocBuilder<BusesBloc,BusesState>(
                   builder: (context,state) {
                     if(state is BusesApiState){
                       return valueContainers(title: 'Total Buses', result: state.myModel.length<10 ? '0${state.myModel.length}':state.myModel.length.toString() , color: AppColors.brown,);
                     }
                    return valueContainers(title: 'Total Buses', result: '_' , color: AppColors.brown,);
                   }
                 ),


                 BlocBuilder<StopsBloc,StopsState>(
                   builder: (context,state) {
                     if(state is StopsApiState){
                       return InkWell(
                           onTap: (){},
                           child: valueContainers(title: 'Total Stops', result: state.myModel.length<10 ?"0${ state.myModel.length}": state.myModel.length.toString(), color: AppColors.orange,));
                     }
                     return valueContainers(title: 'Total Stops', result: '_', color: AppColors.orange,);
                   }
                 ),
               ],),
           ),


          BlocBuilder<BusesBloc,BusesState>(
            builder: (context,state) {
              if(state is BusesApiState){
                return state.myModel.isEmpty? const Text('No buses'):Column(children: [
                  for(int i=0;i<state.myModel.length;i++)
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MyRoute(BusDetails(state.myModel[i])));
                      },
                      child: BusCard(state.myModel[i].license,state.myModel[i].departureTimes))
                ],);
              }

              return Center(child: CircularProgressIndicator(color: AppColors.primary,));
            }
          ),
        ],),
      ),
    );
  }


  Widget _buttons({required String text,required String icon}) {
    return InkWell(
      onTap: () async {
        if (text == 'Change Password') {
          Navigator.push(context, MyRoute(const ChangePassword()));
        }
        if (text == 'Share App') {
          Share.share(
              'https://drive.google.com/file/d/1U8ozUzurVEuuXOeo7ToHXDUnLAhY5EGn/view?usp=sharing');
        }
        if (text == 'About Us') {
          Navigator.push(context, MyRoute(const AboutUsScreen()));
        }
        if (text == 'Privacy Policy') {
          Navigator.push(context, MyRoute(const PrivacyPolicyScreen()));
        }
        if (text == 'Logout') {
          bool s = await onLogOut(context);
          if (s) {
            preferences.remove(AppPrefs.keyId);
            if (preferences.getBool(AppPrefs.keyRememberMe) != true) {
              preferences.remove(AppPrefs.keyEmail);
              preferences.remove(AppPrefs.keyPassword);
            }

            Navigator.pushReplacement(context, MyRoute(Login()));
          }
        }
      },
      child: Container(
        height: 50,
        color: AppColors.white,
        child: Row(
          children: [
            const SizedBox(width: 10, height: 5,),
            Image.asset(icon, height: 30.h, color: AppColors.primary,),
            const SizedBox(width: 14,),
            Text(text, style: AppTextStyles.MontserratSemiBold(
                color: AppColors.black191B32,
                fontSize: 16.sp,
                weight: FontWeight.w400),)
          ],
        ),
      ),
    );
  }

  Widget valueContainers({required String title, required String result,required Color color}){
    return Container(
      width: 1.sw*0.27 ,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
      decoration: BoxDecoration(
          border: Border.all(color: color , width: 1),
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppTextStyles.MontserratMedium(color: AppColors.grey0E0F10,fontSize: 17.0,weight: FontWeight.w500 ),),
          const SizedBox(height: 12),
          Container(
            height: 3,
            width: 22,
            color: color,
          ),
          const SizedBox(height: 12),
          Text(result,style: AppTextStyles.MontserratMedium(color: color,fontSize: 20.0,weight: FontWeight.w500 ),)
        ],
      ),
    );
  }


}

