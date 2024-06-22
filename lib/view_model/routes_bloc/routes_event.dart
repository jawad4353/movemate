part of 'routes_bloc.dart';

abstract class  RoutesEvent extends Equatable{
  const RoutesEvent();
}

class RoutesApiEvent extends RoutesEvent{
  final BuildContext context;
  const RoutesApiEvent(  this.context);
  @override
  List<Object?> get props => [];
}
class  RouteSearchEvent extends RoutesEvent{
  final String searchQuery;
  const RouteSearchEvent(  this.searchQuery);
  @override
  List<Object?> get props => [];
}
