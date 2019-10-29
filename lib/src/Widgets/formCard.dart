import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyectando_mobile/src/bloc/provider.dart';


class FormCard {


  Widget build(LoginBloc bloc) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            _makeUserName(bloc),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            _makePassword(bloc),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     Text(
            //       "Forgot Password?",
            //       style: TextStyle(
            //           color: Colors.blue,
            //           fontFamily: "Poppins-Medium",
            //           fontSize: ScreenUtil.getInstance().setSp(28)
            //           ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget _makeUserName(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.userNameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment_ind,
                    color: Color(0xFF17ead9),
                  ),
                  hintText: "nombre de usuario",
                  labelText: "nombre usuario",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              onChanged: bloc.changeUserName,
            ),
          );
        });
  }

  Widget _makePassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Color(0xFF17ead9)),
                labelText: 'Contraseña',
              ),
            onChanged: bloc.changePassword,
            ),
        );
      },
    );
  }
}
