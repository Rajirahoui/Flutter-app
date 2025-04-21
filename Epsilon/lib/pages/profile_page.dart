import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authService = AuthService();
  File? _imageFile;

  void logout() async {
    await authService.signOut();
  }

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future uploadImage() async {
    if (_imageFile == null) return;
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';
    await Supabase.instance.client.storage
        .from('images')
        .upload(path, _imageFile!)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image téléchargée avec succès")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/apple.png", height: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                currentEmail ?? "Utilisateur",
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
            tooltip: "Déconnexion",
          ),
        ],
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image Preview
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _imageFile != null
                      ? Image.file(_imageFile!, height: 200)
                      : Container(
                          height: 200,
                          width: 200,
                          color: Colors.grey[200],
                          child: const Center(child: Text("Pas d'image sélectionnée")),
                        ),
                ),
                const SizedBox(height: 24),

                // Pick Image Button
                ElevatedButton.icon(
                  onPressed: pickImage,
                  icon: const Icon(Icons.image),
                  label: const Text("Choisir une image"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),

                // Upload Image Button
                ElevatedButton.icon(
                  onPressed: uploadImage,
                  icon: const Icon(Icons.cloud_upload),
                  label: const Text("Téléverser l'image"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
