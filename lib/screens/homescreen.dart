
import 'package:flutter/material.dart';
import 'package:macrologistic/screens/maps/mapscreen.dart';
import 'package:macrologistic/widgets/conductor.dart';

class Homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child:  MapScreen(),),
        CardConductor()
        
      ],
    );
  }
}