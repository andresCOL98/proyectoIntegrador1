import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proyectando_mobile/src/preferencias_usuario/preferencias_usuario.dart';

class ClienteProviders {

  final _prefs = new PreferenciasUsuario();

  Future <Map<String , dynamic>> newCliente(String direccion, String clienteName, String email, String userName, String contrasena, String numero, String nitEmpresa) async {

    final authData = {
        "nombre"   : clienteName,
        "nit"      : nitEmpresa, 
        "telefono" : numero,
        "direccion": direccion,
        "username" : userName,
        "password" : contrasena,
        "email"    : email
    };

    var uri = new Uri.http('proyecto.darevalo.me', '/api/clientes');
    print(_prefs.token);
    final resp = await http.post(
      uri,
      body: authData,
      headers: {HttpHeaders.contentTypeHeader : 'application/json', HttpHeaders.authorizationHeader: _prefs.token}
      );

  }

  Future <Map<String , dynamic>>getClientes() async {

    var uri = new Uri.http('proyecto.darevalo.me', '/api/clientes');

    final resp = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader : 'application/json', HttpHeaders.authorizationHeader: 'Basic $_prefs.token'}
      );
    print(_prefs.token);
    print(resp.statusCode);

  }

}
