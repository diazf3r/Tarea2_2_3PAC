import 'package:flutter/material.dart';
import 'package:myapp/widgets/login_page.dart';
import 'widgets/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final users = {
    'omar.padilla@unah.edu.hn ': '20192001400',
    'omar.diaz@unah.hn': '20192001399',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: 'login',
      routes: {
        // 'registro': (context) => RegistroPage(),
        "login": (context) =>  LoginPage(),
      },
    );
  }
}