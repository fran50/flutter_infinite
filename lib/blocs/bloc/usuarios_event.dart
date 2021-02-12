part of 'usuarios_bloc.dart';

@immutable
abstract class UsuariosEvent {}

class FetchUsuarios extends UsuariosEvent {
  FetchUsuarios();
}
