import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectando_mobile/src/Widgets/title.dart';
import 'package:proyectando_mobile/src/bloc/cliente_bloc.dart';
import 'package:proyectando_mobile/src/bloc/login_bloc.dart';
import 'package:proyectando_mobile/src/providers/cliente_provider.dart';
import 'package:proyectando_mobile/src/providers/usuario_providers.dart';
import 'package:proyectando_mobile/src/utils/utils.dart';

class CrearCliente extends StatelessWidget {
  final TitleW titulo = new TitleW();
  final ClienteBloc blocCliente = new ClienteBloc();
  final LoginBloc bloc = new LoginBloc();
  final UsuarioProviders usuarioProviders = new UsuarioProviders();
  final ClienteProviders clienteProviders = new ClienteProviders();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar cliente'),
      ),
      body: Scrollbar(
        child: Container(
        width: double.infinity,
        child: ListView(
        children: <Widget>[
          titulo.build('CLIENTE'),
          _makeNombreCliente(blocCliente),
          _makeEmail(blocCliente),
          _makeUserName(blocCliente),
          _makePassword(blocCliente),
          _makeNumber(blocCliente),
          _makeDirection(blocCliente),
          _makeNumberNit(blocCliente),
          _makeButton(bloc ,blocCliente, context)
        ]
        ),
      ),
      ),
    );
  }

  _crearCliente(LoginBloc bloc, ClienteBloc blocCliente, BuildContext context) async {

      await clienteProviders.newCliente(blocCliente.direccion, blocCliente.clienteNombre, blocCliente.email, blocCliente.userName, blocCliente.contrasena, blocCliente.numero, blocCliente.nitEmpresa);
      mostrarAlerta(context, "Se registro el cliente");
          //   final route = MaterialPageRoute(
          //   builder: (context){
          //     return PaginaInicio();
          //   }
          // );
          // Navigator.push(context, route);
}

Widget _makeButton(LoginBloc bloc, ClienteBloc blocCliente, context){
    
          return 
          InkWell(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25, bottom: 50),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(330),
              height: ScreenUtil.getInstance().setHeight(100),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF6078ea).withOpacity(.3),
                        offset: Offset(0.0, 8.0),
                        blurRadius: 8.0)
                  ]),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                      _crearCliente(bloc, blocCliente, context);
                  },
                  child: Center(
                    child: Text("REGISTRAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18,
                            letterSpacing: 1.0)),
                  ),
                ),
              ),
            ),
          ));
  }

}

Widget _makeNombreCliente(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.clienteNombreStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment_ind,
                    color: Colors.blue,
                  ),
                  hintText: "nombre del cliente",
                  labelText: "nombre del cliente",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeClienteNombre,
            ),
          );
        });
  }

Widget _makeEmail(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.blue,
                  ),
                  hintText: "Email",
                  labelText: "ingresa un correo electronico",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

Widget _makePassword(ClienteBloc bloc) {
    return StreamBuilder(
      stream: bloc.contrasenaStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue),
                labelText: 'Contraseña',
              ),
            onChanged: bloc.changeContrasena,
            ),
        );
      },
    );
}

Widget _makeNumber(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.numeroStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  hintText: "Numero",
                  labelText: "ingresa el numero del cliente",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeNumero,
            ),
          );
        });
  }

  Widget _makeDirection(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.direccionStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.directions,
                    color: Colors.blue,
                  ),
                  hintText: "Direccion",
                  labelText: "ingresa la direccion del cliente",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeDireccion,
            ),
          );
        });
  }

  Widget _makeNumberNit(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.nitEmpresaStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.looks_one,
                    color: Colors.blue,
                  ),
                  hintText: "Numero",
                  labelText: "ingresa el nit de la empresa que representa",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeNitEmpresa,
            ),
          );
        });
  }

Widget _makeUserName(ClienteBloc bloc) {
    return StreamBuilder(
        stream: bloc.userNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  hintText: "nombre de usuario",
                  labelText: "user name",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeUserName,
            ),
          );
        });
  }