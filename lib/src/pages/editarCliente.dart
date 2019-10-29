import 'package:flutter/material.dart';

class editarCliente extends StatefulWidget {
  editarCliente({Key key}) : super(key: key);

  _editarClienteState createState() => _editarClienteState();
}

class _editarClienteState extends State<editarCliente> {
  @override
  Widget build(BuildContext context) {
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