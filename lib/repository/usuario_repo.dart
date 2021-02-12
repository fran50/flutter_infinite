import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_infinity/models/usuario.dart';
import 'package:query_params/query_params.dart';

class UsuarioRepo {
  Future<List<Usuario>> getUsers(URLQueryParams queryParams) async {
    try {
      http.Response response = await http.get(
          "http://192.168.0.16:3000/usuarios/paginas?${queryParams.toString()}");

      // var cambio[] = jsonDecode(response.body);

      List<dynamic> list = jsonDecode(response.body);

      //print(list);
      List<Usuario> userList = [];
      list.map((data) => userList.add(Usuario.fromJson(data))).toList();
      return userList.length == 0 ? null : userList;
    } catch (err) {
      return null;
    }
  }
}
