import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movemate/network_config/network_config.dart';
import 'package:movemate/utilis/api_urls.dart';
import 'package:movemate/view_model/buses_bloc/buses_bloc.dart';
import '../../model/stops_model.dart';
part 'stops_event.dart';
part 'stops_state.dart';

class StopsBloc extends Bloc<StopsEvent, StopsState> {
  List<BusStop> allStops=[];
  StopsBloc() : super(StopsInitial()) {
    on<StopsEvent>((event, emit) async{
      if(event is StopsApiEvent){
      try{
        ApiResponse response=await NetworkConfig.getApiCallWithToken(ApiUrls.baseUrl+ApiUrls.apiStop);
        print(response.responseString);
       if(response.done??false){
         BusStopListModel myModel=BusStopListModel.fromJson(json.decode(response.responseString??""));
         allStops=myModel.busStops;
         emit(StopsApiState(allStops));
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


      if(event is StopSearchEvent){
       List<BusStop> filteredStops=[];

       if(event.searchQuery.replaceAll(' ', '').isEmpty)
         {
           emit(StopsApiState(allStops));
           return;
         }

        for(int i=0;i<allStops.length;i++){
          if(allStops[i].stopName.toLowerCase().contains(event.searchQuery.toLowerCase())){
            filteredStops.add(allStops[i]);
          }
        }
        emit(StopsApiState(filteredStops));
      }
    });
  }
}
