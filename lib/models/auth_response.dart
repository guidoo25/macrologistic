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
  String idUsuario;
  String idRol;
  String idPadre;
  dynamic nombreEmpresa;
  String usuario;
  String correo;
  String password;
  String idIdioma;
  String modo;
  dynamic idBookindDriver;
  String idBookingPais;
  dynamic idBookingZona;
  dynamic idBookingCiudad;
  dynamic idUbicacion;
  dynamic tipoUbicacion;
  String estado;
  dynamic token;
  String codEmpresa;
  String idPerfil;
  dynamic idTipoSangre;
  String idGenero;
  String idTipoIdentificacion;
  String idEstadoCivil;
  String nombres;
  String apellidos;
  String cedula;
  String celular;
  String telefono;
  String direccion;
  dynamic foto;
  String antecedentes;
  dynamic antecedentesArchivos;
  dynamic idTipoLicencia;
  String estadoUsuario;
  String idioma;

  Data({
    required this.idUsuario,
    required this.idRol,
    required this.idPadre,
    required this.nombreEmpresa,
    required this.usuario,
    required this.correo,
    required this.password,
    required this.idIdioma,
    required this.modo,
    required this.idBookindDriver,
    required this.idBookingPais,
    required this.idBookingZona,
    required this.idBookingCiudad,
    required this.idUbicacion,
    required this.tipoUbicacion,
    required this.estado,
    required this.token,
    required this.codEmpresa,
    required this.idPerfil,
    required this.idTipoSangre,
    required this.idGenero,
    required this.idTipoIdentificacion,
    required this.idEstadoCivil,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.celular,
    required this.telefono,
    required this.direccion,
    required this.foto,
    required this.antecedentes,
    required this.antecedentesArchivos,
    required this.idTipoLicencia,
    required this.estadoUsuario,
    required this.idioma,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUsuario: json["id_usuario"],
        idRol: json["id_rol"],
        idPadre: json["id_padre"],
        nombreEmpresa: json["nombre_empresa"],
        usuario: json["usuario"],
        correo: json["correo"],
        password: json["password"],
        idIdioma: json["id_idioma"],
        modo: json["modo"],
        idBookindDriver: json["id_bookind_driver"],
        idBookingPais: json["id_booking_pais"],
        idBookingZona: json["id_booking_zona"],
        idBookingCiudad: json["id_booking_ciudad"],
        idUbicacion: json["id_ubicacion"],
        tipoUbicacion: json["tipo_ubicacion"],
        estado: json["estado"],
        token: json["token"],
        codEmpresa: json["cod_empresa"],
        idPerfil: json["id_perfil"],
        idTipoSangre: json["id_tipo_sangre"],
        idGenero: json["id_genero"],
        idTipoIdentificacion: json["id_tipo_identificacion"],
        idEstadoCivil: json["id_estado_civil"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        cedula: json["cedula"],
        celular: json["celular"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        foto: json["foto"],
        antecedentes: json["antecedentes"],
        antecedentesArchivos: json["antecedentes_archivos"],
        idTipoLicencia: json["id_tipo_licencia"],
        estadoUsuario: json["estadoUsuario"],
        idioma: json["idioma"],
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "id_rol": idRol,
        "id_padre": idPadre,
        "nombre_empresa": nombreEmpresa,
        "usuario": usuario,
        "correo": correo,
        "password": password,
        "id_idioma": idIdioma,
        "modo": modo,
        "id_bookind_driver": idBookindDriver,
        "id_booking_pais": idBookingPais,
        "id_booking_zona": idBookingZona,
        "id_booking_ciudad": idBookingCiudad,
        "id_ubicacion": idUbicacion,
        "tipo_ubicacion": tipoUbicacion,
        "estado": estado,
        "token": token,
        "cod_empresa": codEmpresa,
        "id_perfil": idPerfil,
        "id_tipo_sangre": idTipoSangre,
        "id_genero": idGenero,
        "id_tipo_identificacion": idTipoIdentificacion,
        "id_estado_civil": idEstadoCivil,
        "nombres": nombres,
        "apellidos": apellidos,
        "cedula": cedula,
        "celular": celular,
        "telefono": telefono,
        "direccion": direccion,
        "foto": foto,
        "antecedentes": antecedentes,
        "antecedentes_archivos": antecedentesArchivos,
        "id_tipo_licencia": idTipoLicencia,
        "estadoUsuario": estadoUsuario,
        "idioma": idioma,
      };
}
