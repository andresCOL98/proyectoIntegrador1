import 'package:flutter/material.dart';

class Proyecto extends StatefulWidget {

  @override
  _proyectoState createState() => _proyectoState();
}

class _proyectoState extends State<Proyecto> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListTile(
         leading: Icon(Icons.person),
       )
    );
  }
}