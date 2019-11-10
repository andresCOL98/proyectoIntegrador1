import 'package:flutter/material.dart';
import 'package:proyectando_mobile/src/models/cliente_model.dart';
import 'package:proyectando_mobile/src/providers/cliente_provider.dart';

class EditarCliente extends StatefulWidget {

  _EditarClienteState createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  
  
  final clienteProvider = ClienteProviders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text('editarCliente'),
         ),
         body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: clienteProvider.getClientes(),
      builder: ( context, AsyncSnapshot<List<ClienteModel>> snapshot){
        print(snapshot.data[0].clienteName);
        if(snapshot.hasData){

          final clientes = snapshot.data;

          return ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (context, i) => _crearItem(clientes[i]),
          );

        }else{
          return Center( child: CircularProgressIndicator(),);
        }

      },

    );
  }

  Widget _crearItem(ClienteModel cliente){

    return ListTile(
      title: Text(cliente.clienteName),
      subtitle: Text(cliente.email),
    );

  }

  List<Widget> _listClientes(List<ClienteModel> data){

    final List<Widget> opciones = [];

    data.forEach ( (opt) {

      final widgetTemp = ListTile(
        title: Text(opt.clienteName),
        leading: Icon(Icons.work),
        trailing: Icon(Icons.edit),
        onTap: (){},
      );

      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;

  }

}




