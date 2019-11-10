import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proyectando_mobile/src/models/cliente_model.dart';
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

  Future<List<ClienteModel>>getClientes() async {

    var uri = new Uri.http('proyecto.darevalo.me', '/api/clientes');

    final resp = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader : 'application/json',
      HttpHeaders.authorizationHeader : 'Bearer '+_prefs.token.toString()}  
    );

    print("GET: "+resp.body);

    final decodeData =  json.decode(resp.body);
    final List<ClienteModel> listCLienteModel = new List();

    print(decodeData);
    decodeData.forEach( (clave){
      print(clave);
      final clienteTemp = ClienteModel.fromJson(clave);
      listCLienteModel.add(clienteTemp);
      
    });

    return listCLienteModel;
  }

}
