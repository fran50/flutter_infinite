import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_infinity/models/usuario.dart';
import 'package:flutter_infinity/repository/usuario_repo.dart';
import 'package:meta/meta.dart';
import 'package:query_params/query_params.dart';

part 'usuarios_event.dart';
part 'usuarios_state.dart';

class UsuariosBloc extends Bloc<UsuariosEvent, UsuariosState> {
  UsuariosBloc() : super(UsuariosInitial());

  UsuarioRepo usuarioRepo = UsuarioRepo();
  List<Usuario> userList = [];
  int page = 0, limit = 10;
  bool isLoading = false;

  @override
  Stream<UsuariosState> mapEventToState(
    UsuariosEvent event,
  ) async* {
    if (event is FetchUsuarios) {
      //print('paso por el fecht');
      if (!isLoading) {
        isLoading = true;
        try {
          page++;
          URLQueryParams queryParams = URLQueryParams();
          queryParams.append('page', page);
          queryParams.append('limit', limit);
          print(queryParams);
          List<Usuario> list = await usuarioRepo.getUsers(queryParams);
          if (list == null) {
            page--;
            isLoading = false;
            //  yield ErrorState(message: "No exiten Usuarios");
            yield LoadedUsers(userList: userList);
          } else {
            userList.addAll(list);
            yield LoadedUsers(userList: userList);
          }
        } catch (e) {
          page--;
          yield ErrorState(message: "error en la carga de Usuarios");
        }
        isLoading = false;
      }
    }
  }
}
