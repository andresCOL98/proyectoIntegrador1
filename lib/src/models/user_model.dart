import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

    // String token;
    String userName;
    String contrasena;

    UserModel({
        // this.token,
        this.userName,
        this.contrasena
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
        // token      : json["token"],
        userName   : json["userName"],
        contrasena : json["contrasena"]
    );

    Map<String, dynamic> toJson() => {
        // "token"      : token,
        "userName"   : userName,
        "contrasena" : contrasena
    };
}