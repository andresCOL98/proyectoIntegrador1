import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectando_mobile/src/Widgets/Title.dart';
import 'package:proyectando_mobile/src/Widgets/formCard.dart';
import 'package:proyectando_mobile/src/bloc/provider.dart';
import 'package:proyectando_mobile/src/pages/inicio.dart';
import 'package:proyectando_mobile/src/providers/usuario_providers.dart';
import 'package:proyectando_mobile/src/utils/utils.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  final UsuarioProviders usuarioProviders = new UsuarioProviders();
  final TitleW titulo = new TitleW();

  bool _isChecked = false;
  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
        body: Stack(
          children: <Widget>[_crearFondo(context), _loginForm(context)],
      ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final FormCard formCard = new FormCard();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListView(
        children: <Widget>[
          titulo.build('GESTOR DE PROYECTOS'),
          formCard.build(bloc),
          SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
          Container(
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: _isChecked,
                    activeColor: Color(0xFF17ead9),
                    checkColor: Colors.white,
                    onChanged: (bool value) {
                      onChanged(value);
                    }),
                Text('Recordarme')
              ],
            ),
          ),
          _makeButton(bloc, context)
        ],
      ),
    );
  }

  Widget _makeButton(LoginBloc bloc, context){
    
          return 
          InkWell(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25),
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
                      _logearse(bloc, context);                     
                  },
                  child: Center(
                    child: Text("INICIAR SESIÓN",
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

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF17ead9), Color(0xFF6078ea)])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
      ],
    );
  }

  _logearse(LoginBloc bloc, BuildContext context) async {

    if(bloc.userName != null && bloc.password != null){
      Map info = await usuarioProviders.newUser(bloc.userName, bloc.password);

      if(info['ok']){
        Navigator.pushReplacementNamed(context, 'inicio');
      }else{
        mostrarAlerta(context, info['mensaje']);
      }
    }else{
      mostrarAlerta(context, "Debes llenar todos los campos");
    }

  }


}

