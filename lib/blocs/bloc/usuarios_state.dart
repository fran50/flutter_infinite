part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosState {}

class UsuariosInitial extends UsuariosState {}

class LoadedUsers extends UsuariosState {
  final List<Usuario> userList;
  LoadedUsers({this.userList});
  List<Object> get props => [this.userList];
}

class ErrorState extends UsuariosState {
  final String message;
  ErrorState({this.message});
  List<Object> get props => [this.message];
}
