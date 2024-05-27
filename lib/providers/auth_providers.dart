import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologistic/config/enviroments.dart';
import 'package:macrologistic/models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  AuthState({required this.autenticando});

  bool autenticando;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(autenticando: false));

  Future<bool> login(String email, String password) async {
    state = AuthState(autenticando: true);

    final data = {
      'usuario': email,
      'password': password,
    };

    final uri = Uri.parse('${Enviroments.apiurl}/login/loginUser');
    final resp = await http.post(
      uri,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    state = AuthState(autenticando: false);

    if (resp.statusCode == 200) {
      final loginResponse = authResponseFromJson(resp.body);

      await this._guardarData(loginResponse.data.idRol,
          loginResponse.data.apellidos, loginResponse.data.idUsuario);

      return true;
    } else {
      return false;
    }
  }

  Future<void> _guardarData(String role, String empresa, String userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
    await prefs.setString('sol', empresa);
    await prefs.setString('userid', userid);
  }

  // Future<void> _guardarToken(
  //     String role, String solicitante, int userid) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('role', role);
  //   await prefs.setString('sol', solicitante);
  //   await prefs.setInt('userid', userid);
  // }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
