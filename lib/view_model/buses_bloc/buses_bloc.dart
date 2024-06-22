import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movemate/model/buses_model.dart';
import 'package:movemate/network_config/network_config.dart';
import 'package:movemate/utilis/api_urls.dart';
part 'buses_event.dart';
part 'buses_state.dart';

class BusesBloc extends Bloc<BusesEvent, BusesState> {
  List<Bus> allBuses=[];
  BusesBloc() : super(BusesInitial()) {
    on<BusesEvent>((event, emit) async{
      if(event is BusesApiEvent){
      try{
        ApiResponse response=await NetworkConfig.getApiCallWithToken(ApiUrls.baseUrl+ApiUrls.apiBus);
        print(response.responseString);
       if(response.done??false){
         print('emitted state');
         BusesModel myModel=BusesModel.fromJson(json.decode((response.responseString??'')));
         allBuses=myModel.buses;
         emit(BusesApiState(allBuses));
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


      if(event is BusSearchEvent){
        List<Bus> filteredBuses=[];

        if(event.searchQuery.replaceAll(' ', '').isEmpty)
        {
          emit(BusesApiState(allBuses));
          return;
        }

        for(int i=0;i<allBuses.length;i++){
          if(allBuses[i].license.toLowerCase().contains(event.searchQuery.toLowerCase())){
            filteredBuses.add(allBuses[i]);
          }
        }
        emit(BusesApiState(filteredBuses));
      }
    });
  }
}
