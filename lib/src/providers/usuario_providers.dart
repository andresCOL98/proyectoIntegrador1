import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proyectando_mobile/src/models/user_model.dart';
import 'package:proyectando_mobile/src/preferencias_usuario/preferencias_usuario.dart';


class UsuarioProviders{

  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> verificar(String userName, String contrasena) async {

    final authData = {
      'username' : userName,
      'password' : contrasena,
      'returnSecureToken' : true
    };
    var uri = new Uri.http('proyecto.darevalo.me', '/api/token/verify');
    
    final resp = await http.post(
      uri,
      body: json.encode(authData),
      headers: {HttpHeaders.contentTypeHeader : 'application/json', HttpHeaders.authorizationHeader: PreferenciasUsuario().token}
    );
    
    Map <String, dynamic> decodedData = json.decode(resp.body);

    if(decodedData.containsKey('detail')){
      print('acá llegó');
      return {'ok' : true, 'mensaje' : decodedData['detail']};

    }else{
      return {'ok' : false};
    }

  }

  Future<Map<String, dynamic>> newUser(String userName, String contrasena) async {

    final authData = {
      'username' : userName,
      'password' : contrasena,
      // 'returnSecureToken' : true
    };

    var uri = new Uri.http('proyecto.darevalo.me', '/api/login');
    
    final resp = await http.post(
      uri,
      body: authData,
    );
    
    Map <String, dynamic> decodedData = json.decode(resp.body);

    if(decodedData.containsKey('access')){

      print('acá llegó');

      _prefs.token = decodedData['access'];

      return {'ok' : true, 'token' : decodedData['access']};

    }else{
      return {'ok' : false, 'mensaje' : decodedData['detail']};
    }
    

  }

}

