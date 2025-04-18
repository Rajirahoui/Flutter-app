import 'package:flutter/material.dart';
import 'package:flutter_application_1/myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App RAJI - AYA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 205, 172, 11)),
      ),
      home: const MyHomePage(title: 'Bienvenue sur notre application'),
    );
  }
}