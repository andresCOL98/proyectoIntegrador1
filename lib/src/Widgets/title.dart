import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleW {
  Widget build(String title) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 35, left: 16.0, right: 16.0, top: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontFamily: "Ewert",
                        letterSpacing: .6)),
              )
            ]),
      ),
    );
  }
}
