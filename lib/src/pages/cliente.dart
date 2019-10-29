import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectando_mobile/src/pages/crearCliente.dart';

class Cliente extends StatelessWidget {
  const Cliente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('opciones Cliente'),
      ),
      body: Center(
        child: new Container(
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(500),
          child: Padding(
            padding: EdgeInsets.only(left: 40.0, right: 0.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                _makeButtonCrear(context),
                _makeButtonEditar(context)
              ],
            ),
          ),
        )
      ),
    );


  }

  Widget _makeButtonCrear(context){
    
    return InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 50),
          child: Container(
            width: ScreenUtil.getInstance().setWidth(330),
            height: ScreenUtil.getInstance().setHeight(86),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                    final route = MaterialPageRoute(
                      builder: (context){
                        return CrearCliente();
                      }
                    );
                    Navigator.push(context, route);
                },
                child: Center(
                  child: Text('Crear Cliente',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                          letterSpacing: 1.0)),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _makeButtonEditar(context){
    
    return InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 50),
          child: Container(
            width: ScreenUtil.getInstance().setWidth(330),
            height: ScreenUtil.getInstance().setHeight(86),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                    final route = MaterialPageRoute(
                      builder: (context){
                        return CrearCliente();
                      }
                    );
                    Navigator.push(context, route);
                },
                child: Center(
                  child: Text('Editar Cliente',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                          letterSpacing: 1.0)),
                ),
              ),
            ),
          ),
        ));
  }


}
