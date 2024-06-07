import 'package:cronos/services/auth/auth_service.dart';
import 'package:cronos/components/my_button.dart';
import 'package:cronos/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    //servicio
    final authService = AuthService();

    //login
    try {
      await authService.singInWhitEmailAndPassword(_emailController.text, _passwordController.text,);
    } 
    //errors
    catch (e) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.message,
              size: 60, color: Theme.of(context).colorScheme.primary),

          const SizedBox(height: 50),

          //welcome back
          Text(
            '¡Bienvenido de vuelta!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          //email
          MyTextField(
            hintText: 'Correo',
            obscureText: false,
            controller: _emailController, focusNode: FocusNode()
          ),

          const SizedBox(height: 10),

          //password
          MyTextField(
            hintText: 'Contraseña',
            obscureText: true,
            controller: _passwordController, focusNode: FocusNode()
          ),

          const SizedBox(height: 25),

          //login button
          MyButton(
            text: 'Iniciar sesión',
            onTap: () => login(context),
          ),

          const SizedBox(height: 25),

          //login
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "¿No tienes cuenta? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "regístrate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
