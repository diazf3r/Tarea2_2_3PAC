import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final users = {
    "user1": {
      'name': 'claudio.vasquez@unah.hn',
      'password': '20192002377',
    },
    "user2": {
      'name': 'omar.diaz@unah.hn',
      'password': '20192001399',
    },
  };
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool checkCredentials(String email, String password) {
    print(email);
    print(password);
    for (var user in users.values) {
      print(user);
      if (user['name'] == email && user['password'] == password) {
        print("found match");
        return true; // Found a match!
      }
    }
    print("shit failed");
    return false; // No match found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomInput(
                      controller: correoController,
                      label: "Correo",
                      maxLength: 40,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El nombre es obligatorio';
                        }

                        if (!value.contains('@') || !value.contains('unah.edu.hn') || !value.contains('unah.hn')) {
                          return 'El correo no es válido';
                        }

                        return null;
                      },
                    ),
                    CustomInput(
                      controller: passwordController,
                      label: "Contraseña",
                      icon: Icons.lock,
                      maxLength: 30,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La contraseña es obligatoria';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            print('returning');
                            return;
                          }
                          print('valid form');
                          final email = correoController.text;
                          final password = passwordController.text;

                          var check = false;

                          for (var user in users.values) {
                            print(user);
                            if (user['name'] == email &&
                                user['password'] == password) {
                              check = true;
                            }
                          }

                          print(check);

                        },
                        child: const Text('Iniciar sesion')),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
               //go to registro
              },
              child: const Text('Registrarse')),
        ]));
  }
}