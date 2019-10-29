import 'package:flutter/material.dart';
import 'package:proyectando_mobile/src/bloc/provider.dart';
import 'package:proyectando_mobile/src/pages/Login.dart';
import 'package:proyectando_mobile/src/pages/inicio.dart';
import 'package:proyectando_mobile/src/pages/start.dart';
import 'package:proyectando_mobile/src/preferencias_usuario/preferencias_usuario.dart';

Future main() async { 
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        final prefs = new PreferenciasUsuario();
        print(prefs.token);

        return Provider(
          child: MaterialApp(
            
            debugShowCheckedModeBanner: false,
            title: 'Gestor de proyectos',
            initialRoute: 'Login',
            routes: {
              'Login' : (BuildContext context) => Login(),
              'start' : (BuildContext context) => Start(),
              'inicio': (BuildContext context) => PaginaInicio()
            }         
          ),
        );  
  }
}

