part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterApiEvent extends RegisterEvent{
  final BuildContext context;
  final Map map;
  const RegisterApiEvent( this.map, this.context);
  @override
  List<Object?> get props => [];
}
