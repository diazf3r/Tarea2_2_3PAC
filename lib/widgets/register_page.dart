import 'package:flutter/material.dart';
import 'custom_input.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
         body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomInput(
                    label: 'Nombre',
                    icon: Icons.person,
                    maxLength: 30,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorio';
                      }
                      return null;
                    },
                  ),
                  CustomInput(
                    controller: emailController,
                    label: 'Correo',
                    maxLength: 35,
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El correo es obligatorio';
                      }
                      
                      if (value.contains('@unah.edu.hn') || value.contains('@unah.hn')) {
                        return null;
                      }

                      return 'El correo no es válido';
                    },
                  ),
                  CustomInput(
                    controller: phoneController,
                    label: 'Telefono',
                    maxLength: 10,
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El teléfono es obligatorio';
                      }

                      if (int.tryParse(value) == null) {
                        return 'El teléfono no es válido';
                      }
                      if (value.length != 8) {
                        return 'El teléfono debe tener 8 dígitos';
                      }

                      if (value.contains('9') || value.contains('3')) {
                        return null;
                      }

                      return 'El teléfono debe iniciar con 3 o 9';
                    },
                  ),
                  CustomInput(
                    controller: passwordController,
                    label: 'Contraseña',
                    icon: Icons.lock,
                    obscureText: true,
                    maxLength: 20,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingrese una contraseña';
                      }

                      if (value.length < 8) {
                        return 'La Contraseña debe tener al menos 8 caracteres';
                      }

                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'La contraseña debe contener al menos una letra mayúscula';
                      }

                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'La contraseña debe contener al menos un número';
                      }

                      if (!value.contains(RegExp(r'.*[\¬\!\"\£\$\%\^\&\*\(\)\_\+\`\-\=\{\}\:\@\~\<\>\?\[\]\;//\\#\,\.\/\\\|]'))) {
                        return 'La contraseña debe contener al menos un caracter especial';
                      }

                      return null;
                    },
                  ),
                  CustomInput(
                    controller: confirmpasswordController,
                    label: 'Confirmar Contraseña',
                    icon: Icons.lock,
                    obscureText: true,
                    maxLength: 20,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Debe confirmar su contraseña';
                      }

                      if (value != passwordController.text) {
                        return 'Las contraseñas no coinciden';
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

                      final data = {
                        'nombre': nameController.text,
                        'correo': emailController.text,
                        'contrasenia': passwordController.text,
                        'telefono': phoneController.text,
                      };

                      print(data);
                    },
                    child: const Text('Registrate'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}