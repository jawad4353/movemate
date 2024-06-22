import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movemate/network_config/network_config.dart';
import 'package:movemate/utilis/api_urls.dart';
import '../../model/RouteModel.dart';
part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RouteState> {
  List<BusRouteModel> allRoutes=[];
  RoutesBloc() : super(RouteInitial()) {
    on<RoutesEvent>((event, emit) async{
      if(event is RoutesApiEvent){
      try{

        ApiResponse response=await NetworkConfig.getApiCallWithToken(ApiUrls.baseUrl+ApiUrls.apiRoute);
        print(response.responseString);
       if(response.done??false){
         BusRouteList myModel=BusRouteList.fromJson(json.decode(response.responseString??""));
         allRoutes=myModel.routes;
        emit(RouteApiState(allRoutes));
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

      if(event is RouteSearchEvent){
        List<BusRouteModel> filteredRoutes=[];

        if(event.searchQuery.replaceAll(' ', '').isEmpty)
        {
          emit(RouteApiState(allRoutes));
          return;
        }

        for(int i=0;i<allRoutes.length;i++){
          if(allRoutes[i].name.toLowerCase().contains(event.searchQuery.toLowerCase())){
            filteredRoutes.add(allRoutes[i]);
          }
        }
        emit(RouteApiState(filteredRoutes));
      }
    });
  }


}
