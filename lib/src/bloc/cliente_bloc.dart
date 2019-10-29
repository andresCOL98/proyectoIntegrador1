import 'dart:async';
import 'package:proyectando_mobile/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class ClienteBloc with Validators {

  //Inicializamos los controladores para cada campo
  final _clienteNameController        = BehaviorSubject<String>();
  final _emailController              = BehaviorSubject<String>();
  final _contrasenaController         = BehaviorSubject<String>();
  final _numeroController             = BehaviorSubject<String>();
  final _userNameController           = BehaviorSubject<String>();
  final _direccionController          = BehaviorSubject<String>();
  final _nitEmpresaController         = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get clienteNombreStream => _clienteNameController.stream.transform(validarNombreCliente);
  Stream<String> get emailStream         => _emailController.stream.transform(validarEmail);
  Stream<String> get contrasenaStream    => _contrasenaController.stream.transform(validarNombreCliente);
  Stream<String> get numeroStream        => _numeroController.stream.transform(validarNumber);
  Stream<String> get userNameStream      => _userNameController.stream.transform(validarNombreCliente);
  Stream<String> get direccionStream     => _direccionController.stream.transform(validarNombreCliente);
  Stream<String> get nitEmpresaStream    => _nitEmpresaController.stream.transform(validarNumber);

  Stream<bool> get formValidStream => 
  Observable.combineLatest5(clienteNombreStream, emailStream, contrasenaStream, numeroStream, nitEmpresaStream, (a,b,c,d,e)=> true);

  // Insertar valores al Stream
  Function(String) get changeClienteNombre => _clienteNameController.sink.add;
  Function(String) get changeEmail         => _emailController.sink.add;
  Function(String) get changeContrasena    => _contrasenaController.sink.add;
  Function(String) get changeNumero        => _numeroController.sink.add;
  Function(String) get changeUserName      => _userNameController.sink.add;
  Function(String) get changeDireccion     => _direccionController.sink.add;
  Function(String) get changeNitEmpresa    => _nitEmpresaController.sink.add;


  // Obtener el último valor ingresado a los streams
  String get clienteNombre => _clienteNameController.value;
  String get email         => _emailController.value;
  String get contrasena    => _contrasenaController.value;
  String get numero        => _numeroController.value;
  String get userName      => _userNameController.value;
  String get direccion     => _userNameController.value;
  String get nitEmpresa    => _nitEmpresaController.value;

  //metodo para cerrar los controladores cuando no se les necesite
  dispose() {
    _clienteNameController?.close();
    _emailController?.close();
    _contrasenaController?.close();
    _numeroController?.close();
    _userNameController?.close();
    _direccionController?.close();
    _nitEmpresaController?.close();
  }

}