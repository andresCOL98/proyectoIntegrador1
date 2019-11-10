import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String userModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {

    String clienteName;
    String email;
    String userName;
    String password;
    String number;
    String direction;
    String nitCompany;

    ClienteModel({
        this.clienteName,
        this.email,
        this.userName,
        this.password,
        this.number,
        this.direction,
        this.nitCompany
    });

    factory ClienteModel.fromJson(Map<String, dynamic> json) => new ClienteModel(
        clienteName   : json["clienteName"],
        email         : json["email"],
        userName      : json["userName"],
        password      : json["password"],
        number        : json["number"],
        direction     : json["direction"],
        nitCompany    : json["nitCompany"]
    );

    Map<String, dynamic> toJson() => {
        "clienteName"   : clienteName,
        "email"         : email,
        "userName"      : userName,
        "password"      : password,
        "number"        : number,
        "direction"     : direction,
        "nitCompany"    : nitCompany
    };
}