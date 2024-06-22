part of 'buses_bloc.dart';

abstract class BusesState extends Equatable{
  const BusesState();
}

class BusesInitial extends BusesState {
  @override
  List<Object> get props => [];
}


class BusesApiState extends BusesState {
  List<Bus> myModel;
  BusesApiState(this.myModel);
  @override
  List<Object> get props => [myModel];
}


