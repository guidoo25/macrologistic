
import 'package:go_router/go_router.dart';
import 'package:macrologistic/screens/login/login.dart';

final appRouter = GoRouter(initialLocation: '/Login', routes: [

  GoRoute(
    path: '/Login',
    name: 'Login',
    builder: (context, state) => LoginPage(),
  ),

]);