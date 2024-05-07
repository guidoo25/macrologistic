import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:macrologistic/config/enviroments.dart';
import 'package:macrologistic/shared/login/my_button.dart';
import 'package:macrologistic/shared/login/my_textfield.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authService = Provider.of<AuthService>( context );

    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                color: Enviroments.primaryColor,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Image(image: AssetImage('icono.png'), width: 200, height: 200,),

                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      )),
                      Text(
                        'Visualiza tus viajes asignados, rutas optimas y horarios.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                        )),
                        SizedBox(height: 10,),
                        Text ('!Seguridad primero!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 22,
                        ))

                    

                  ],
                ),
              ),
                Container(
            
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),

                    ),
                  ),
                  child:Column(
                    children: [
                      Container(
                child: Image.asset(
                    'logoSistema.png'),
                width: 200,
                height: 200,
              ),
              
              MyTextField(
                controller: usernameController,
                hintText: 'Usuario',
                obscureText: false,
              ),

              const SizedBox(height: 5),
              MyTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                obscureText: true,
              ),
              TextButton(onPressed: (){}, child: Text('Olvidaste tu contraseña?')),
              MyButton(
                color: Colors.blue,
                onTap: () {
                  context.go('/home');
                  

                },
                // Commented out the onTap code block
                // onTap: ref.watch(authProvider).autenticando
                //     ? null
                //     : () async {
                //         FocusScope.of(context).unfocus();

                //         final loginOk =
                //             await ref.read(authProvider.notifier).login(
                //                   usernameController.text.trim(),
                //                   passwordController.text.trim(),
                //                 );

                //         if (loginOk) {
                //           // TODO: Cambiar a mi main page
                //           context.go('/home');
                //         } else {
                //           // Mostrar alerta
                //           showSnackbar(context, "Error al iniciar sesión");
                //         }
                //       },
                nametext: 'Ingresar', 
              ),

                    ],
                  ),
                )
            ],
            
          ),
        ),
      ),
    );
  }
}