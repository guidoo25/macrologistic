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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  color: Enviroments.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Image.asset('assets/icono.png', width: 100, height: 100),
                    SizedBox(height: 20),
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Image.asset('assets/logoSistema.png',
                        width: 175, height: 175),
                    SizedBox(height: 20),
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Usuario',
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Contraseña',
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Olvidaste tu contraseña?'),
                      ),
                    ),
                    SizedBox(height: 20),
                    MyButton(
                      color: Colors.blue,
                      onTap: () {
                        context.go('/home');
                      },
                      nametext: 'Ingresar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
