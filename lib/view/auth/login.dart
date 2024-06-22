import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/main.dart';
import 'package:movemate/utilis/app_preferences.dart';
import 'package:movemate/utilis/app_routes.dart';
import 'package:movemate/utilis/app_text_styles.dart';
import 'package:movemate/view/auth/forget_password.dart';
import 'package:movemate/view/auth/register.dart';
import 'package:movemate/view_model/login_bloc/login_bloc.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../../utilis/api_params.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../../utilis/app_images.dart';
import '../screens/bottom_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email= TextEditingController();
  final TextEditingController _password= TextEditingController();
  bool rememberMe=true,hidePassword=true;

  @override
  initState(){
    super.initState();
    if(preferences.getBool(AppPrefs.keyRememberMe)==true){
      _email.text=preferences.getString(AppPrefs.keyEmail)??"";
      _password.text=preferences.getString(AppPrefs.keyPassword)??"";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(height:1.sh*0.92,width: 1.sw,color: AppColors.white,),
                  _header(),
                  Positioned(
                    top: 38.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppConstants.welcomeBack,style: AppTextStyles.MontserratExtraBold(color: AppColors.white, fontSize: 30.sp, weight: FontWeight.w700),),
                        SizedBox(height: 5.h,),
                        Text(AppConstants.enterUsernamePassword,style: AppTextStyles.MontserratSemiBold(color: AppColors.white, fontSize: 14.sp, weight: FontWeight.w500),),
          
                      ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 1.sh*0.28),
                    child: Column(children: [
                      _textField(isPasswordField:false ,title:AppConstants.email ,hintText:AppConstants.userNameHint ,controller: _email,icon: AppImages.iconStudent),
                      SizedBox(height: 20.h,),
                      _textField(isPasswordField: true,title:AppConstants.password ,hintText:'●●●●●●' ,controller: _password,icon: AppImages.iconPassword),
                      SizedBox(height: 3.h,),
                      _forgetRememberMe(),
                      SizedBox(height: 3.h,),
                      _loginButton(),
                    ],),
                  ),
                  Positioned(
                      bottom: 35.h,
                      left: 0,
                      right: 0,
                      child: _bottom()),
          
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _header(){
    return ClipPath(
      clipper: ProsteBezierCurve(
        position: ClipPosition.bottom,
        list: [
          BezierCurveSection(
            start: const Offset(0, 166),
            top: Offset(1.sw / 4, 190),
            end: Offset(1.sw  / 2, 155),
          ),
          BezierCurveSection(
            start: Offset(1.sw  / 2, 25),
            top: Offset(1.sw / 4 * 3, 100),
            end: Offset(1.sw , 150),
          ),
        ],
      ),
      child: Container(
        height: 1.sh *0.3,
        width: 1.sw ,
        color: AppColors.primary,
        child:  Opacity(opacity: 0.3,
          child: Image.asset(AppImages.imgPattern,fit: BoxFit.cover,color: AppColors.white,),
    ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hintText,
    required String title,
    required icon,
    required bool isPasswordField,
  }) {
    return Container(
      height: 60.h,
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.greyB2AFAF, width: 1.1),
      ),
      child: Row(
        children: [
          Container(
            height: 37.h,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            child: Image.asset(icon, color: AppColors.primary),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 2.w),
            child: const VerticalDivider(width: 1.2),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  child: Text(
                    title,
                    style: AppTextStyles.MontserratSemiBold(
                      color: AppColors.grey0E0F10,
                      fontSize: 14.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                  // Remove the width property
                  child: TextField(
                    onChanged: (a) {},
                    controller: controller,
                    cursorColor: AppColors.primary,
                    cursorWidth: 3,
                    cursorHeight: 16,
                    obscureText: isPasswordField ? hidePassword : false,
                    style: AppTextStyles.MontserratMedium(
                      color: AppColors.black191B32,
                      fontSize: 14.sp,
                      weight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: isPasswordField
                          ? InkWell(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Image.asset(
                          hidePassword
                              ? AppImages.iconVisibility
                              : AppImages.iconVisibilityOff,
                          color: AppColors.primary,
                          height: 50,
                          width: 50,
                        ),
                      )
                          : null,
                      contentPadding: EdgeInsets.only(bottom: 12.h),
                      hintText: hintText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _loginButton(){
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
            if(_email.text.replaceAll(' ', '').isEmpty){
              EasyLoading.showInfo('Email required !');
              return;
            }
            if(_password.text.replaceAll(' ', '').isEmpty){
              EasyLoading.showInfo('Password required !');
              return;
            }
            context.read<LoginBloc>().add(LoginApiEvent({Params.email:_email.text,Params.password:_password.text}, context, false, rememberMe));
            // BlocListener<LoginBloc,LoginState>(listener: (BuildContext context, state) {
            //   if(state is LoginApiState){
            //     print('state is login api state ');
            //
            //   }
            // },);

          }, child:Text(AppConstants.login,style: AppTextStyles.MontserratBold(color: AppColors.black, fontSize: 16.sp, weight: FontWeight.w600),) ),
    );
  }

  Widget _forgetRememberMe(){
    return Row(children: [
      Checkbox.adaptive(
          fillColor: MaterialStateProperty.resolveWith((states) => AppColors.primary),
          checkColor:AppColors.black,
          activeColor: AppColors.white,
          overlayColor: MaterialStateProperty.resolveWith((states) => AppColors.white) ,
          value: rememberMe, onChanged: (a){
        setState(() {
          rememberMe=a!;
        });
      }),
      Text(AppConstants.rememberMe,style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 14.sp, weight: FontWeight.w500)),
      const Spacer(),
      TextButton(onPressed: (){
        Navigator.push(context, MyRoute(const ForgetPassword()));
      }, child: Text(AppConstants.forgotPassword,style: AppTextStyles.MontserratSemiBold(color: AppColors.primary, fontSize: 14.sp, weight: FontWeight.bold)))
    ],);
  }

  Widget _bottom(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppConstants.dontHaveAccount,style: AppTextStyles.MontserratSemiBold(color: AppColors.black191B32, fontSize: 14.sp, weight: FontWeight.w500),),
        InkWell(
          onTap: (){
            Navigator.push(context, MyRoute(const Register()));
          },
          child:Text(AppConstants.signUp,style:AppTextStyles.MontserratSemiBold(color: AppColors.primary, fontSize: 16.sp, weight: FontWeight.w600) ,),
        )
      ],);
  }
}
