import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movemate/network_config/network_config.dart';
import 'package:movemate/utilis/api_urls.dart';
import 'package:movemate/view/auth/login.dart';
import '../../utilis/app_routes.dart';
import '../../view/screens/bottom_screen.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async{
      if(event is RegisterApiEvent){
      try{
        EasyLoading.show(status: 'Signing Up');
        ApiResponse response=await NetworkConfig.postApiCall(ApiUrls.baseUrl+ApiUrls.apiSignUp, event.map);
        print(response.responseString);
       if(response.done??false){
         Map map =json.decode(response.responseString??"");
         if(map['success']==true){
           EasyLoading.showInfo(map['message']);
           Navigator.push(event.context, MyRoute(const Login()));
         }
         else if(map['success']==false){
           EasyLoading.showInfo(map['message']);
         }
       }
       else{
         EasyLoading.showInfo(response.errorMsg??'');
       }

       }
       catch(e){
          //EasyLoading.dismiss();
           EasyLoading.showError(e.toString());
           print(e.toString());
      }
      }
    });
  }
}
