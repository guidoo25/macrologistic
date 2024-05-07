
import 'package:go_router/go_router.dart';
import 'package:macrologistic/screens/conductor/list_viahes.dart';
import 'package:macrologistic/screens/homescreen.dart';
import 'package:macrologistic/screens/login/login.dart';
import 'package:macrologistic/screens/login/loginfinal.dart';
import 'package:macrologistic/screens/maps/mapscreen.dart';
import 'package:macrologistic/screens/navbart.dart';

final appRouter = GoRouter(initialLocation: '/Login', routes: [

  GoRoute(
    path: '/Login',
    name: 'Login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(path: 
  '/Home',
  name: 'Home',
  builder: (context, state) => navbar()
  ),
  GoRoute(
    path: '/viajes',
    name: 'viajes',
    builder: (context, state) => ListViajes(),
  ),
  GoRoute(path: '/login2',name :'Login2',builder: (context, state) => LoginPageFinal()),

]);