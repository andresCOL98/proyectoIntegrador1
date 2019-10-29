import 'dart:async';
import 'package:proyectando_mobile/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  //Inicializamos los controladores para cada campo
  // final _tokenController    = BehaviorSubject<String>();
  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  // Stream<String> get tokenStream    => _tokenController.stream.transform( validarNombreCliente );
  Stream<String> get userNameStream => _userNameController.stream.transform( validarNombreCliente );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );

  Stream<bool> get formValidStream => 
  Observable.combineLatest2(userNameStream, passwordStream, ( e, p) => true );

  // Insertar valores al Stream
  // Function(String) get changeToken    => _tokenController.sink.add;
  Function(String) get changeUserName => _userNameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  // String get token    => _tokenController.value;
  String get userName => _userNameController.value;
  String get password => _passwordController.value;

  //metodo para cerrar los controladores cuando no se les necesite
  dispose() {
    // _tokenController?.close();
    _userNameController?.close();
    _passwordController?.close();
  }

}