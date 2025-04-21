import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    // get auth service 
    final authService = AuthService();

    // text controllers 
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    // login button pressed 
    void login() async {
      final email = _emailController.text;
      final password = _passwordController.text;

      // atempt try 
      try {
        await authService.signInWithEmailPassword(email, password);
      }
      
      // catch any error
      catch (i) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content : Text("erreur : $i")));
        }
      }
    }
 
  // build 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          // logo
          Center(child: Image.asset('assets/images/apple.png')),

          //email
          TextField(
            controller: _emailController,
            decoration : const InputDecoration(labelText: "Email"),
          ),

          // password
          TextField(
            controller: _passwordController,
            decoration : InputDecoration(labelText: "Password"),
            obscureText: true,

          ),

          const SizedBox(height: 12),

          //button
          ElevatedButton(
            onPressed: login, 
            child: const Text("Connexion"),
          ),
    
          const SizedBox(height: 12),

          // go to register page to sign up
          GestureDetector(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const RegisterPage()
              )),
            child: const Center(child: Text("Pas de compte ? s'enregister")), 
          )
        ],
      ),
    );
  }
}