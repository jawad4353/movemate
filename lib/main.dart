import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/splash_screen.dart';
import 'package:movemate/utilis/app_colors.dart';
import 'package:movemate/view_model/buses_bloc/buses_bloc.dart';
import 'package:movemate/view_model/login_bloc/login_bloc.dart';
import 'package:movemate/view_model/register_bloc/register_bloc.dart';
import 'package:movemate/view_model/routes_bloc/routes_bloc.dart';
import 'package:movemate/view_model/stops_bloc/stops_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
String ? bearerToken;
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  preferences=await SharedPreferences.getInstance();
  runApp( MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:AppColors.primary
  ));

}

class MyApp extends StatelessWidget {
  Size ? size;
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return ScreenUtilInit(
     designSize:  Size(size!.width, size!.height),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => RegisterBloc()),
          BlocProvider(create: (context) => RoutesBloc()),
          BlocProvider(create: (context) => BusesBloc()),
          BlocProvider(create: (context) => StopsBloc()),

        ],
        child: MaterialApp(
         debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
