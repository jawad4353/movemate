part of 'stops_bloc.dart';

abstract class StopsState extends Equatable{
  const StopsState();
}

class StopsInitial extends StopsState {
  @override
  List<Object> get props => [];
}


class StopsApiState extends StopsState {
  final List<BusStop> myModel;
  const StopsApiState(this.myModel);
  @override
  List<Object> get props => [myModel];
}


