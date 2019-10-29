import 'package:flutter/material.dart';
import 'package:proyectando_mobile/src/pages/Proyecto.dart';
import 'package:proyectando_mobile/src/pages/inversionista.dart';

import 'cliente.dart';

  class PaginaInicio extends StatefulWidget{
  @override
  PaginaInicioState createState() {

    return PaginaInicioState();
  }

  }

  class PaginaInicioState extends State<PaginaInicio>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Proyectando'),
        ),
        drawer: Drawer(
            child: _contenidoMenu(context)
        ),
        body: Stack(
          children: <Widget>[
            _crearFondo(context)
          ],
        )
      );
  }

}

ListView _contenidoMenu(BuildContext context){

  return ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage('assets/miFoto.jpg'),
        ),
        accountName: Text("Andres Cortes"),
        accountEmail: Text("cortes.andres.98@hotmail.com"),
      ),   
      ListTile(
        leading: Icon(Icons.accessibility_new),
        title: Text("Opciones cliente"),
        onTap: (){
            final route = MaterialPageRoute(
            builder: (context){
              return Cliente();
            }
          );
          Navigator.push(context, route);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.accessibility_new),
        title: Text("Crear inversionista"),
        onTap: (){
          final route = MaterialPageRoute(
            builder: (context){
              return Inversionista();
            }
          );
          Navigator.push(context, route);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.assignment),
        title: Text("Proyecto"),
        onTap: (){
          final route = MaterialPageRoute(
            builder: (context){
              return Proyecto();
            }
          );
          Navigator.push(context, route);
        },
      )
    ],
  );

}

Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF17ead9), Color(0xFF6078ea)])),

    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
          
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
      ],
    );
  }


