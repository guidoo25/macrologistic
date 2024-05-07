import 'package:flutter/material.dart';
import 'package:macrologistic/shared/button_estade.dart';

class CardConductor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      
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
               
                MyButtonestade(
                  onTap: () {},
                  nametext: 'Partida',
                  color: Colors.yellow,
                  icon: Icons.play_arrow,
                ),
                SizedBox(width: 20),
                MyButtonestade(onTap: (){}, nametext: 'Inicio', color: Colors.blue, icon: Icons.location_on),
                SizedBox(width: 20),
                MyButtonestade(onTap: (){}, nametext: 'Final', color: Colors.green, icon: Icons.flag),
                SizedBox(width: 20),
                MyButtonestade(onTap: (){
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Novedad'),
                    content: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ingrese la novedad',
                        labelText: 'Ingresar novedad',
                        border: OutlineInputBorder()
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Enviar'))
                    ],
                  ));
                                    
                }, nametext: 'Novedad', color: Colors.red, icon: Icons.warning_rounded),
                ],
              ),
          const SizedBox(height: 10),
          Text(
            'Nombre del Cliente',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              
              Icon(Icons.location_on, color: Colors.black),
              const SizedBox(width: 5),
              Text(
                'Ubicación del Cliente: Aeropuerto Jose Joaquin de Olmedo',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),



            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.arrow_forward, color: Colors.black),
              const SizedBox(width: 5),
              Text(
                'Lugar de destino: Hotel Oro Verde',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}