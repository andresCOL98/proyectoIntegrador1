import 'package:flutter/material.dart';

class Proyecto extends StatefulWidget {

  @override
  _proyectoState createState() => _proyectoState();
}

class _proyectoState extends State<Proyecto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proyecto')
      ),
      body: Container(
       child: Column(
         children: <Widget>[
           FloatingActionButton(
             child: Text('Crear Proyectos'),
             
             onPressed: () {},
           ),
           
         ],
       )
    ),

    );
  }
}