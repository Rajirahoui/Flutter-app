import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // get auth service 
    final authService = AuthService();

    // text controllers 
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirPasswordController = TextEditingController();

    // sign up button pressed
    void signUp () async {
      // prepare data
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirPasswordController.text;

      // check that password match
      if(password != confirmPassword){
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("mauvais mot de passe")));
        return;
      }

      // attempt sih up 
      try {
        await authService.signUpWithEmailPassword(email, password);

        // pop register page
        Navigator.pop(context);
      } 
      
      // catch any errors..
      catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Erreur : $e")));
        }
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text("s'enregistrer")
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

          TextField(
            controller: _confirPasswordController,
            decoration : InputDecoration(labelText: " Confirm Password"),
            obscureText: true,
          ),

          const SizedBox(height: 12),

          //button
          ElevatedButton(
            onPressed: signUp, 
            child: const Text("s'enregistrer"),
          ),

        ],
      ),
    );
  }
}