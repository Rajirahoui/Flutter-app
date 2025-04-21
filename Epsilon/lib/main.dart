import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImttY25vb2FuaXVzdHVleWVpaWR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUwNzE0MTcsImV4cCI6MjA2MDY0NzQxN30.RE879r88ZsMImWS8mPsgH9XQZUmeP0BBz346jyVL8T0",
    url: "https://kmcnooaniustueyeiidz.supabase.co",
  );

  runApp(const MyApp());
}




