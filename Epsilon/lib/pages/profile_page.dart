import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authService = AuthService();
  PlatformFile? _selectedFile;

  void logout() async {
    await authService.signOut();
  }

  Future pickAnyFile() async {
    final result = await FilePicker.platform.pickFiles(
      withData: true,
      allowMultiple: false,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedFile = result.files.single;
      });

      await uploadFile(_selectedFile!.name, _selectedFile!.bytes!);
    }
  }

  Future uploadFile(String fileName, Uint8List fileBytes) async {
    final path = 'uploads/$fileName';

    try {
      await Supabase.instance.client.storage
          .from('epsilon') // <-- remplace par ton nom de bucket
          .uploadBinary(
            path,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Fichier téléchargé avec succès")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" Erreur: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentUserEmail();

    return Scaffold(
      appBar: AppBar(
        title: Text(currentEmail ?? "Utilisateur"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Sélectionner un fichier à téléverser",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                _selectedFile != null
                    ? Text("📄 ${_selectedFile!.name}")
                    : const Text("Aucun fichier sélectionné"),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: pickAnyFile,
                  icon: const Icon(Icons.attach_file),
                  label: const Text("Choisir un fichier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
