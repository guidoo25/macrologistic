import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologistic/models/reservas_response.dart';
import 'package:macrologistic/providers/mylocation.dart';
import 'package:macrologistic/screens/reservas/home_reservas.dart';

class Listviajest extends ConsumerWidget {
  final List<ReservasResponse> reservas;

  Listviajest({
    required this.reservas,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: reservas.length,
      itemBuilder: (context, index) {
        ReservasResponse reserva = reservas[index];

        // Determinar el color del estado
        Color estadoColor =
            reserva.estado == 'FINALIZADO' ? Colors.green : Colors.yellow;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const Icon(Icons.location_on),
            title: Text('Salida: ${reserva.descripcionInicio}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Icon(Icons.arrow_forward),
                Text('Destino: ${reserva.descripcionFin}'),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: estadoColor,
              radius: 9,
            ),
            onTap: () {
              ref.read(destinationProvider.notifier).state = LatLng(
                double.parse(reserva.latitudDestino),
                double.parse(reserva.longitudDestino),
              );
              ref.read(myLocationProvider.notifier).state = LatLng(
                double.parse(reserva.latitudOrigen),
                double.parse(reserva.longitdOrigen),
              );
              ref.read(markersProvider.notifier).state = [
                Marker(
                  point: LatLng(double.parse(reserva.latitudOrigen),
                      double.parse(reserva.longitdOrigen)),
                  width: 80,
                  height: 80,
                  child: const Icon(Icons.my_location,
                      color: Colors.blue, size: 45),
                ),
                Marker(
                  point: LatLng(double.parse(reserva.latitudDestino),
                      double.parse(reserva.longitudDestino)),
                  width: 80,
                  height: 80,
                  child: const Icon(Icons.location_on,
                      color: Colors.red, size: 45),
                ),
                if (reserva.latitudIntermedio != null &&
                    reserva.longitudIntermedio != null)
                  Marker(
                    point: LatLng(double.parse(reserva.latitudIntermedio),
                        double.parse(reserva.longitudIntermedio)),
                    width: 80,
                    height: 80,
                    child: const Icon(Icons.location_on,
                        color: Colors.orange, size: 45),
                  ),
              ];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeReservas()),
              );
            },
          ),
        );
      },
    );
  }
}
