import 'package:flutter/material.dart';
import 'package:proyectando_mobile/src/providers/cliente_provider.dart';

class EditarCliente extends StatefulWidget {

  _EditarClienteState createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  final clienteProvider = ClienteProviders();
  @override
  Widget build(BuildContext context) {
    clienteProvider.getClientes();
    return Scaffold(
         appBar: AppBar(
           title: Text('editarCliente'),
         ),
         body: Scrollbar(
           child: ListView(
             children: <Widget>[
               
             ],
           ),
         ),
    );
  }
}

List<Widget> _listClientes(List<dynamic> data){

  final List<Widget> opciones = [];

  data.forEach ( (opt) {

    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: Icon(Icons.work),
      trailing: Icon(Icons.edit),
      onTap: (){},
    );

    opciones..add(widgetTemp)
            ..add(Divider());

  });

  return opciones;

}