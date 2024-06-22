part of 'stops_bloc.dart';

abstract class  StopsEvent extends Equatable{
  const StopsEvent();
}

class  StopsApiEvent extends StopsEvent{
  final BuildContext context;
  const StopsApiEvent(  this.context);
  @override
  List<Object?> get props => [];
}


class  StopSearchEvent extends StopsEvent{
 final String searchQuery;
  const StopSearchEvent(  this.searchQuery);
  @override
  List<Object?> get props => [];
}
