import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologistic/shared/button_estade.dart';
import 'package:macrologistic/providers/mylocation.dart';

class CardConductor extends ConsumerWidget {
  List<String> novedades = [
    'PENDIENTE_CANCELACION',
    'CANCELADO',
    'NO_SE_PUEDE_CUMPLIR_SOLICITUD_CLIENTE',
    'ASIENTO_INFANTIL_INCOMPATIBLE_CON_VEHICULO',
    'ASIENTO_INFANTIL_NO_DISPONIBLE',
    'ASIENTO_INFANTIL_NO_SOPORTADO',
    'PARADA_ADICIONAL',
    'FUERZA_MAYOR',
    'DETALLES_INCOMPLETOS_DE_RESERVA',
    'DIRECCION_INCORRECTA',
    'TIEMPO_DE_ANTICIPACION_DEMASIADO_CORTO',
    'NUMERO_DE_VUELO_FALTANTE',
    'SIN_DISPONIBILIDAD',
    'ERROR_DE_TARIFA',
    'CIERRE_DE_CARRETERA',
    'OTRO'
  ];
  String? novedadSeleccionada;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Hace que la columna ocupe solo el espacio necesario
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButtonestade(
                    onTap: () async {
                      await updateMyLocation(ref);
                      LatLng finalPosition = LatLng(-2.1482, -79.9667);
                      ref.read(destinationProvider.notifier).state =
                          finalPosition;
                      updateMarkers(ref);
                      // Llamar a getCoordinates si la ubicación actual ya está disponible
                      final myLocation = ref.read(myLocationProvider);
                      if (myLocation != null) {
                        ref
                            .read(pointsProvider.notifier)
                            .state
                            .clear(); // Limpiar puntos previos
                        getCoordinates(ref, myLocation, finalPosition);
                      }
                    },
                    nametext: 'Partida',
                    color: Colors.yellow,
                    icon: Icons.play_arrow,
                  ),
                  SizedBox(width: 10),
                  MyButtonestade(
                    onTap: () async {
                      final turist = LatLng(-2.1895, -79.8780);
                      ref.read(destinationProvider.notifier).state = turist;
                      updateMarkers(ref);
                      final myLocation = ref.read(myLocationProvider);
                      if (myLocation != null) {
                        ref
                            .read(pointsProvider.notifier)
                            .state
                            .clear(); // Limpiar puntos previos
                        getCoordinates(ref, myLocation, turist);
                      }
                    },
                    nametext: 'Inicio',
                    color: Colors.blue,
                    icon: Icons.location_on,
                  ),
                  SizedBox(width: 10),
                  MyButtonestade(
                    onTap: () {},
                    nametext: 'Final',
                    color: Colors.green,
                    icon: Icons.flag,
                  ),
                  SizedBox(width: 10),
                  MyButtonestade(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Novedad'),
                                content: DropdownButton<String>(
                                  hint: Text('Seleccione una novedad'),
                                  value: novedadSeleccionada,
                                  onChanged: (String? newValue) {},
                                  items: novedades
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Enviar'))
                                ],
                              ));
                    },
                    nametext: 'Novedad',
                    color: Colors.red,
                    icon: Icons.warning_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Nombre del Cliente',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text('Status:Asignado'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Ubicación del Cliente: Aeropuerto Jose Joaquin de Olmedo',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.arrow_forward, color: Colors.black),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Lugar de destino: Hotel Oro Verde',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
