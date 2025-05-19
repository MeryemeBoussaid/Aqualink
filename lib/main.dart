import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Assure l'initialisation Flutter avant Firebase
  await Firebase.initializeApp();             // Initialise Firebase

  runApp(const AquaLinkApp());
}

class AquaLinkApp extends StatelessWidget {
  const AquaLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardPage(),
    );
  }
}
