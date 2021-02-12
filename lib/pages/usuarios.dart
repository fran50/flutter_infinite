import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinity/blocs/bloc/usuarios_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class Usuarios extends StatefulWidget {
  Usuarios({Key key}) : super(key: key);

  @override
  _UsuariosState createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  UsuariosBloc usuariosBloc;
  @override
  void initState() {
    super.initState();
    usuariosBloc = BlocProvider.of<UsuariosBloc>(context);
    usuariosBloc.add(FetchUsuarios());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Usuarios',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      body: Container(child: BlocBuilder<UsuariosBloc, UsuariosState>(
        builder: (context, state) {
          if (state is LoadedUsers) {
            return LazyLoadScrollView(
                onEndOfPage: () => usuariosBloc.add(FetchUsuarios()),
                scrollOffset: 70,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        //  leading: CircleAvatar(
                        //      backgroundImage:
                        //          NetworkImage(state.userList[index].img)),
                        title: Text(state.userList[index].nombre),
                        trailing: OutlinedButton(
                          child: Text('detalle'),
                          onPressed: () {},
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.userList.length));
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
