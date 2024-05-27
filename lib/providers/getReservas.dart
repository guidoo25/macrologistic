import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologistic/config/enviroments.dart';
import 'dart:convert';

import 'package:macrologistic/models/reservas_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ReservasResponse>> getViajes(String userId) async {
  final response = await http.post(
    Uri.parse('${Enviroments.apiurl}/login/getReservasByUsuario'),
    body: {
      'iduser': userId.toString(),
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );

  if (response.statusCode == 200) {
    final List<ReservasResponse> viajes =
        reservasResponseFromJson(response.body);
    return viajes;
  } else {
    throw Exception('Failed to load reservas');
  }
}

final userIdProvider = FutureProvider<String>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('userid') ?? '';
});

final viajesProvider = FutureProvider<List<ReservasResponse>>((ref) async {
  final userId = await ref.watch(userIdProvider.future);
  return getViajes(userId);
});
