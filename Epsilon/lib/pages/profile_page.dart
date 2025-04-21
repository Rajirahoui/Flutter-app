import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // get auth service
  final authService = AuthService();

  // log out button pressed 
  void logout() async { 
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // get user email 
    final currentEmail = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
        // logo et utilisateur 
        Image.asset("assets/images/apple.png", height: 70,),
        Padding(padding: EdgeInsets.only(left: 16.0)),
        Text(currentEmail.toString()),
          ],
        ),
        actions: [
          // log out
          IconButton(onPressed: logout, icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}