import 'dart:async';

class Validators {


  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( userName, sink ) {


      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if ( regExp.hasMatch( userName ) ) {
        sink.add( userName );
      } else {
        sink.addError('userName no es correcto');
      }

    }
  );

  final validarNumber = StreamTransformer<String, String>.fromHandlers(

    handleData: (numero, sink){

      Pattern pattern = r'^[0-9]{6-10}';
      RegExp regExp = new RegExp(pattern);

      if(regExp.hasMatch(numero)){
        sink.add(numero);
      }else{
        sink.addError('Debes ingresar numeros, minimo 6 y maximo 10');
      }

    }

  );

  final validarNombreCliente = StreamTransformer<String, String>.fromHandlers(

    handleData: (nombreCliente, sink){

      if(nombreCliente.length>6){
        sink.add(nombreCliente);
      } else {
        sink.addError('más de 6 caracteres por favor');
      }

    }

  );
      
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {

      if ( password.length >= 6 ) {
        sink.add( password );
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }

    }
  );
      
}
      
      