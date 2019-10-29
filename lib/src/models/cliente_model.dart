import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String userModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {

    String clienteName;
    String email;
    String contrasena;
    String numero;
    String nameUser;
    String direccion;
    String nitEmpresa;

    ClienteModel({
        this.clienteName,
        this.email,
        this.contrasena,
        this.numero,
        this.nitEmpresa
    });

    factory ClienteModel.fromJson(Map<String, dynamic> json) => new ClienteModel(
        clienteName   : json["clienteName"],
        email         : json["email"],
        contrasena    : json["contrasena"],
        numero        : json["numero"],
        nitEmpresa    : json["nitEmpresa"]
    );

    Map<String, dynamic> toJson() => {
        "clienteName"   : clienteName,
        "email"         : email,
        "contrasena"    : contrasena,
        "numero"        : numero,
        "nitEmpresa"    : nitEmpresa
    };
}