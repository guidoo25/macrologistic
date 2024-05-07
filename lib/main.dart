
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologistic/config/enviroments.dart';
import 'package:macrologistic/router/approuter.dart';
import 'package:macrologistic/theme/apptheme.dart';

void main() async {
  await Enviroments().initEnviroments();
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),

    );
  }
}