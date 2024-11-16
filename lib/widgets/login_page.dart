import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final users = {
    "user1": {
      'name': 'omar.padilla@unah.edu.hn',
      'password': 'Test123/',
    },
    "user2": {
      'name': 'omar.diaz@unah.hn',
      'password': 'Estoesunaprueba/2',
    },
  };
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Iniciar Sesión'),
          centerTitle: true,
        ),
        body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomInput(
                      controller: correoController,
                      label: "Correo",
                      maxLength: 35,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El correo es obligatorio';
                        }

                        if (!value.contains('@')) {
                          return 'El correo no es válido';
                        }

                        return null;
                      },
                    ),
                    CustomInput(
                      controller: passwordController,
                      label: "Contraseña",
                      icon: Icons.lock,
                      maxLength: 20,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la contraseña';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          final email = correoController.text;
                          final password = passwordController.text;

                          for (var user in users.values) {
                            if (user['name'] == email &&
                                user['password'] == password) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(email: email),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Iniciar sesion')),
                  ],
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Registrarse')),
        ]));
  }
}
