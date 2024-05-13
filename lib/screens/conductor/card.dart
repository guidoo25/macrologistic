import 'package:flutter/material.dart';
import 'package:macrologistic/models/viaje.dart';

class ConductorCard extends StatelessWidget {
  final Viaje viaje;

  ConductorCard({
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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Origen: ${viaje.origen}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Cliente: ${viaje.cliente}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Destino: ${viaje.destino}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fecha: ${viaje.fecha}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Estado: ${viaje.estado}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
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
    );
  }
}