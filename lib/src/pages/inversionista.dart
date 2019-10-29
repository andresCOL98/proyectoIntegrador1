import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectando_mobile/src/Widgets/title.dart';
import 'package:proyectando_mobile/src/bloc/inversionista_bloc.dart';

import 'inicio.dart';

class Inversionista extends StatelessWidget {
  final TitleW titulo = new TitleW();
  final InversionistaBloc bloc = new InversionistaBloc();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar inversionista'),
      ),
      body: Scrollbar( 
        child: Container(
        width: double.infinity,
        child: ListView(
        children: <Widget>[
          titulo.build('INVERSIONISTA'),
          _makeUserName(bloc),
          _makeEmail(bloc),
          _makePassword(bloc),
          _makeNumber(bloc),
          _makeButton(bloc, context)
        ],
      ),
      ),
      )
    );
  }

}

Widget _makeUserName(InversionistaBloc bloc) {
    return StreamBuilder(
        stream: bloc.inversionistaNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment_ind,
                    color: Colors.blue,
                  ),
                  hintText: "nombre del inversionista",
                  labelText: "nombre del inversionista",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeInversionistaName,
            ),
          );
        });
  }

Widget _makeEmail(InversionistaBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.blue,
                  ),
                  hintText: "Email",
                  labelText: "ingresa un correo electronico",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

Widget _makePassword(InversionistaBloc bloc) {
    return StreamBuilder(
      stream: bloc.contrasenaStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue),
                labelText: 'Contraseña',
              ),
            onChanged: bloc.changeContrasena,
            ),
        );
      },
    );
}

Widget _makeNumber(InversionistaBloc bloc) {
    return StreamBuilder(
        stream: bloc.numeroControler,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  hintText: "Numero",
                  labelText: "ingresa el numero del inversionista",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeNumero,
            ),
          );
        });
  }

 Widget _makeButton(InversionistaBloc bloc, context){
    
          return 
          InkWell(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25, bottom: 50),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(330),
              height: ScreenUtil.getInstance().setHeight(100),
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
                          return PaginaInicio();
                        }
                      );
                      Navigator.push(context, route);
                  },
                  child: Center(
                    child: Text("REGISTRAR",
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