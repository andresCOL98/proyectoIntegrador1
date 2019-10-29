
import 'package:flutter/material.dart';
import 'inversionista_bloc.dart';
export 'inversionista_bloc.dart';

class ProviderInversionista extends InheritedWidget {

  static ProviderInversionista _instancia;

  factory ProviderInversionista({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new ProviderInversionista._internal(key: key, child: child );
    }

    return _instancia;

  }

  ProviderInversionista._internal({ Key key, Widget child })
    : super(key: key, child: child );


  final inversionistaBloc = InversionistaBloc();

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;



  static InversionistaBloc of (BuildContext context) {
    return ( context.inheritFromWidgetOfExactType(ProviderInversionista) as ProviderInversionista ).inversionistaBloc;
  }

}