import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologistic/config/enviroments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologistic/models/viaje.dart';
import 'package:macrologistic/providers/filterList_state.dart';
import 'package:macrologistic/screens/conductor/list_builder_viajes.dart';



class ListViajes extends ConsumerWidget {

  final List<Viaje> viajeslista = [
    Viaje(
      origen: 'AV de las Americas',
      cliente:'Juan Perez',
      destino: 'Alborada 4t Etapa',
      descripcion: '5 minutos de viaje',
      estado: 'Completado',
      imagen: 'map.PNG',
      fecha: '2024-10-10  13:00',
    ),
    Viaje(
      origen: ' villamil playas',
      cliente : 'Maria Yanez',
      destino: 'Shopping libertad',
      descripcion: '1:30 de viaje',
      estado: 'Cancelado',
      imagen : '',
      fecha: '2024-10-10  15:00',
    ),
    Viaje(
      cliente : 'Carlos Rodriguez',
      origen: 'Cementerio general',
      destino: 'Arcos Plaza',
      descripcion: '1 hora de viaje',
      estado: 'Completado',
      imagen: 'map2.PNG',
      fecha: '2024-10-10  17:00',
    ),
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final vaijesList = ref.watch(vaijesListProvider);
   final viajesPendientes =Viajeslist().filterByStatus('Pendiente');
 
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
                  text: 'Todos',
                ),
                Tab(
                  text: 'Pendientes',
                ),
                Tab(
                  text: 'Completados',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Listviajest(viajesBonitos: viajeslista),
              Center(child: Text('Pendientes'),),
              Center(child: Text('Completados'),),

                         ],
          ),
        ),
      ),
    );
  }
}
