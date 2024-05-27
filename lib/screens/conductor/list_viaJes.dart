import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologistic/config/enviroments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologistic/models/reservas_response.dart';
import 'package:macrologistic/providers/filterList_state.dart';
import 'package:macrologistic/providers/getReservas.dart';
import 'package:macrologistic/screens/conductor/list_builder_viajes.dart';
import 'package:http/http.dart' as http;
import 'package:macrologistic/screens/pruebas/pruebabuilder.dart';

class ListViajes extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viajesAsyncValue = ref.watch(viajesProvider);
    final viajesPendientes = Viajeslist().filterByStatus('Pendiente');

    return MaterialApp(
      color: Enviroments.primaryColor,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Viajes'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Completados',
                ),
                Tab(
                  text: 'Pendientes',
                ),
                Tab(
                  text: 'Anulados',
                ),
              ],
            ),
          ),
          body: viajesAsyncValue.when(
            data: (viajes) {
              return TabBarView(
                children: [
                  PruebaListviajest(),
                  Listviajest(
                    reservas: viajes,
                  ),
                  Center(
                    child: Text('Anulados'),
                  ),
                ],
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
          ),
        ),
      ),
    );
  }
}
