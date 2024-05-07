import 'package:flutter/material.dart';
import 'package:macrologistic/models/viaje.dart';

class Listviajest extends StatelessWidget {
   List<Viaje> viajesBonitos = [];
  Listviajest({
    required this.viajesBonitos,
  });
  

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
                itemCount: viajesBonitos.length,
                itemBuilder: (context, index) {
                  Viaje viaje = viajesBonitos[index];

                  // Determinar el color del estado
                  Color estadoColor = index % 2 == 0 ? Colors.green : Colors.red;

                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const Icon(Icons.location_on),
                      title: Text('Salida:${viaje.origen}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        children:  [
                          Icon(Icons.arrow_forward),
                          Text('Destino:${viaje.destino}'),
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: estadoColor,
                        radius: 9,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Trazabilidad del viaje'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cliente: ${viaje.cliente}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('Destino: ${viaje.destino}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('Descripción: ${viaje.descripcion}', style: const TextStyle(fontSize: 12)),
                                Text('Estado: ${viaje.estado}', style: const TextStyle(color: Colors.grey)),
                                Container(
                                  child: viaje.imagen.isNotEmpty ? Image.asset('${viaje.imagen}', height: 150) : const SizedBox.shrink(),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cerrar'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
  }
}