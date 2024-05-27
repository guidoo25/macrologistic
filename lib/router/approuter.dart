import 'package:go_router/go_router.dart';
import 'package:macrologistic/screens/conductor/list_viaJes.dart';
import 'package:macrologistic/screens/login/login.dart';

import 'package:macrologistic/screens/navbart.dart';

final appRouter = GoRouter(initialLocation: '/Login', routes: [
  GoRoute(
    path: '/Login',
    name: 'Login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(path: '/Home', name: 'Home', builder: (context, state) => navbar()),
  GoRoute(
    path: '/viajes',
    name: 'viajes',
    builder: (context, state) => ListViajes(),
  ),
]);
