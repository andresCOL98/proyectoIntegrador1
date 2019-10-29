import 'package:flutter/cupertino.dart';
import 'cliente_bloc.dart';
export 'cliente_bloc.dart';

class ProviderCliente extends InheritedWidget {

  static ProviderCliente _instancia;

  factory ProviderCliente({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new ProviderCliente._internal(key: key, child: child );
    }

    return _instancia;

  }

  ProviderCliente._internal({ Key key, Widget child })
    : super(key: key, child: child );


  final clienteBloc = ClienteBloc();

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;



  static ClienteBloc of (BuildContext context) {
    return ( context.inheritFromWidgetOfExactType(ProviderCliente) as ProviderCliente ).clienteBloc;
  }

}