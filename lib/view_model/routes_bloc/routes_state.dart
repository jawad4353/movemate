part of 'routes_bloc.dart';

abstract class RouteState extends Equatable{
  const RouteState();
}

class RouteInitial extends RouteState {
  @override
  List<Object> get props => [];
}


class RouteApiState extends RouteState {
  List<BusRouteModel> myModel;
  RouteApiState(this.myModel);
  @override
  List<Object> get props => [myModel];
}


