part of 'buses_bloc.dart';

abstract class  BusesEvent extends Equatable{
  const BusesEvent();
}

class BusesApiEvent extends BusesEvent{
  final BuildContext context;
  const BusesApiEvent(  this.context);
  @override
  List<Object?> get props => [];
}


class  BusSearchEvent extends BusesEvent{
  final String searchQuery;
  const BusSearchEvent(  this.searchQuery);
  @override
  List<Object?> get props => [];
}
