import 'dart:async';
import 'package:proyectando_mobile/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class InversionistaBloc with Validators {

  //Inicializamos los controladores para cada campo
  final _inversionistaNameController = BehaviorSubject<String>();
  final _emailController             = BehaviorSubject<String>();
  final _contrasenaController        = BehaviorSubject<String>();
  final _numeroController            = BehaviorSubject<String>();

  Stream<String> get inversionistaNameStream => _inversionistaNameController.stream.transform( validarNombreCliente );
  Stream<String> get emailStream             => _emailController.stream.transform( validarEmail );
  Stream<String> get contrasenaStream        => _contrasenaController.stream.transform( validarPassword );
  Stream<String> get numeroControler         => _numeroController.stream.transform(validarNumber);

  Stream<bool> get formValidStream =>
  Observable.combineLatest4(inversionistaNameStream, emailStream, contrasenaStream, numeroControler, (a,b,c,d) => true);

  Function get changeInversionistaName => _inversionistaNameController.sink.add;
  Function get changeEmail             => _emailController.sink.add;
  Function get changeContrasena        => _contrasenaController.sink.add;
  Function get changeNumero            => _numeroController.sink.add;

  String get inversionistaName => _inversionistaNameController.value;
  String get email             => _emailController.value;
  String get contrasena        => _contrasenaController.value;
  String get numero            => _numeroController.value;

  dispose(){

    _inversionistaNameController?.close();
    _emailController?.close();
    _contrasenaController?.close();
    _numeroController?.close();

  }




}