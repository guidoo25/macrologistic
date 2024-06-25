// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  bool status;
  String msg;
  String title;
  String icon;
  String respuesta;
  Data data;

  AuthResponse({
    required this.status,
    required this.msg,
    required this.title,
    required this.icon,
    required this.respuesta,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        status: json["status"],
        msg: json["msg"],
        title: json["title"],
        icon: json["icon"],
        respuesta: json["respuesta"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "title": title,
        "icon": icon,
        "respuesta": respuesta,
        "data": data.toJson(),
      };
}

class Data {
  int idUsuario;
  int idRol;

  String apellidos;

  Data({
    required this.idUsuario,
    required this.idRol,
    required this.apellidos,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUsuario: json["id_usuario"],
        idRol: json["id_rol"],
        apellidos: json["apellidos"],
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "id_rol": idRol,
        "apellidos": apellidos,
      };
}
