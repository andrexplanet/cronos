import 'package:cronos/services/auth/auth_service.dart';
import 'package:cronos/components/my_button.dart';
import 'package:cronos/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    // get service
    final _auth = AuthService();  

    if (_passwordController.text == _confirmController.text) {
      try {
      _auth.singUpWhitEmailAndPassword(
      _emailController.text, 
      _passwordController.text
      );
      } catch (e) {
        showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
      }

      
      
    }

    //error

      else {
        showDialog(
        context: context, 
        builder: (context) => const AlertDialog(
          title: Text("Las contraseñas no coinciden"),
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
            'listo para unirte?',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          //email
          MyTextField(
            hintText: 'Email',
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(height: 10),

          //password
          MyTextField(
            hintText: 'password',
            obscureText: true,
            controller: _passwordController,
          ),

          const SizedBox(height: 10),

          //confirm
          MyTextField(
            hintText: 'confirm password',
            obscureText: true,
            controller: _confirmController,
          ),

          const SizedBox(height: 25),

          //register button
          MyButton(
            text: 'Registrarse',
            onTap: () => register(context),
          ),

          const SizedBox(height: 25),

          //login
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "ya tienes una cuenta? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "log in",
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
