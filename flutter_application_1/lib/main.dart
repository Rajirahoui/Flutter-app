import 'package:flutter/material.dart';
import 'package:flutter_application_1/myapp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://eewhrndyokznchegevos.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVld2hybmR5b2t6bmNoZWdldm9zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ5ODUwMjUsImV4cCI6MjA2MDU2MTAyNX0.SITlFgnBzypX3dLwu-vUzQkBx6gfSLDxbnKutfawcRA',
  );
  runApp(MyApp());
}



