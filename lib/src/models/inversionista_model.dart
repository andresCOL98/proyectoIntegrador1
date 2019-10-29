import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String userModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {

    String inversionistaName;
    String email;
    String contrasena;
    //CREAR COMBO BOX PARA ESTE CAMPO
    String tipo;
    String numeroContacto;

    ClienteModel({
        this.inversionistaName,
        this.email,
        this.contrasena,
        this.numeroContacto,
    });

    factory ClienteModel.fromJson(Map<String, dynamic> json) => new ClienteModel(
        inversionistaName : json["inversionistaName"],
        email             : json["email"],
        contrasena        : json["contrasena"],
        numeroContacto    : json["numeroContacto"],
    );

    Map<String, dynamic> toJson() => {
        "clienteName"    : inversionistaName,
        "email"          : email,
        "contrasena"     : contrasena,
        "numeroContacto" : numeroContacto
    };
}