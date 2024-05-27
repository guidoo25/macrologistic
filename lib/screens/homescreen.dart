import 'package:flutter/material.dart';
import 'package:macrologistic/screens/maps/mapscreen.dart';
import 'package:macrologistic/widgets/conductor.dart';
import 'package:macrologistic/widgets/noasignado_card.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: MapScreen(),
        ),
        Align(
          alignment: Alignment.center,
          child: NoSelectedTripsCard(),
        ),
      ],
    );
  }
}
