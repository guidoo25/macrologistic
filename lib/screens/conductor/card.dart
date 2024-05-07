import 'package:flutter/material.dart';
import 'package:macrologistic/models/viaje.dart';

class conductorCard extends StatelessWidget {
   final Viaje viaje;
  conductorCard({
    required this.viaje,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Origen: ${viaje.origen}'),
                  Text('Cliente: ${viaje.cliente}'),
                  Text('Destino: ${viaje.destino}'),
                  Text('Fecha: ${viaje.fecha}'),
                  Text('Estado: ${viaje.estado}'),
                
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/${viaje.imagen}',
                width: 50,
                height: 50,
              ),
            ],
          ),
        ],
      ),

    );
  }
}