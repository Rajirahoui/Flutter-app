import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // listen yo auth change
      stream : Supabase.instance.client.auth.onAuthStateChange,

      // build appropriate page based on auth state 
      builder:(context, snapshot) {
        // loading ..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body : Center(child: CircularProgressIndicator()),
          );
        }
        // chek if there is a valid session currently 
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session !=  null){
          return const ProfilePage();
        } else {
          return const LoginPage();
        }
      }
    );
  }
}