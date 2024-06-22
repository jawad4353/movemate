import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/view_model/register_bloc/register_bloc.dart';
import '../../utilis/api_params.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../../utilis/app_images.dart';
import '../../utilis/app_routes.dart';
import '../../utilis/app_text_styles.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();
  TextEditingController _confirmPassword= TextEditingController();
  TextEditingController _session= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body:ListView(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.w),
              child: Stack(
                children: [
                  Container(height:1.sh*0.92,width: 1.sw,color: AppColors.white,),
                  Column(
                    children: [
                      SizedBox(height: 1.sh*0.04,),
                      _header(),
                      SizedBox(height: 30.h,),
                      _textField(title:AppConstants.email ,hintText:AppConstants.userNameHint ,controller: _email,icon: AppImages.iconStudent),
                      SizedBox(height: 20.h,),
                      _textField(title:AppConstants.password ,hintText:'●●●●●●' ,controller: _password,icon: AppImages.iconPassword),
                      SizedBox(height: 20.h,),
                      _textField(title:AppConstants.confirmPassword ,hintText:'●●●●●●' ,controller: _confirmPassword,icon: AppImages.iconPassword),
                     // SizedBox(height: 20.h,),
                   //   _textField(title:AppConstants.phoneNumber ,hintText:'+923017831992' ,controller: _password,icon: AppImages.iconPhoneNumber),
                    //  SizedBox(height: 20.h,),
                   //   _textField(title:AppConstants.session ,hintText:'2020-2024' ,controller: _session,icon: AppImages.iconSession),
                      SizedBox(height: 20.h,),
                      _registerButton(),
                    ],
                  ),
                  Positioned(
                      bottom: 25.h,
                      left: 0,
                      right: 0,
                      child: _bottom()),
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }



  Widget _header(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppConstants.signUp,style: AppTextStyles.MontserratExtraBold(color: AppColors.black191B32, fontSize: 30.sp, weight: FontWeight.w700),),
        SizedBox(height: 5.h,),
        Text(AppConstants.enterRealInformation,style: AppTextStyles.MontserratSemiBold(color: AppColors.grey0E0F10, fontSize: 14.sp, weight: FontWeight.w500),),

      ],);
  }


  Widget _textField({required TextEditingController controller,required String hintText,required String title,required icon}){
    return Container(
      height: 60.h,
      width: 1.sw*0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: AppColors.greyB2AFAF,width: 1.1)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 37.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              child: Image.asset(icon,color: AppColors.primary,)),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 2.w),
            child: const VerticalDivider(width: 1.2,),
          ),
          SizedBox(width: 8.w,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(title,style: AppTextStyles.MontserratSemiBold(color: AppColors.grey0E0F10, fontSize: 14.sp, weight: FontWeight.w500),)),
              SizedBox(
                height: 20.h,
                width: 1.sw*0.66,
                child: TextField(
                  cursorHeight: 16,
                  controller: controller,
                  cursorColor: AppColors.primary,
                  cursorWidth: 3,
                  onChanged: (a){},
                  style: AppTextStyles.MontserratMedium(color: AppColors.black191B32, fontSize: 14.sp, weight: FontWeight.w400),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 12.h),
                      hintText: hintText
                  ),
                ),
              )
            ],),
        ],
      ),
    );
  }


  Widget _registerButton(){
    return  SizedBox(
      height: 48.h,
      width: double.maxFinite,
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r)
              )
          ) ,
          onPressed: (){
            if(_email.text.replaceAll(" ", '').isEmpty){
              EasyLoading.showInfo('Email required !');
              return;
            }
            if(_password.text.replaceAll(" ", '').isEmpty){
              EasyLoading.showInfo('Password required !');
              return;
            }
            if(_password.text.replaceAll(" ", '').length<8){
              EasyLoading.showInfo('Password must have eight characters');
              return;
            }
            if(_confirmPassword.text.replaceAll(" ", '').isEmpty){
              EasyLoading.showInfo('Confirm password required !');
              return;
            }
            if(_password.text!=_confirmPassword.text){
              EasyLoading.showInfo('Password & confirm password not matching !');
              return;
            }
            context.read<RegisterBloc>().add(RegisterApiEvent({Params.email:_email.text,Params.password:_password.text}, context));

          }, child:Text(AppConstants.save,style: AppTextStyles.MontserratBold(color: AppColors.black, fontSize: 16.sp, weight: FontWeight.w600),) ),
    );
  }


  Widget _bottom(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppConstants.alreadyHaveAccount,style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 14.sp, weight: FontWeight.w500),),
        InkWell(
          onTap: (){
            Navigator.push(context, MyRoute(const Login()));
          },
          child: Text(AppConstants.login,style:AppTextStyles.MontserratSemiBold(color: AppColors.primary, fontSize: 16.sp, weight: FontWeight.w600) ,)
        )
      ],);
  }
}
