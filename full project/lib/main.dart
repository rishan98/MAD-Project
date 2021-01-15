import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(welcome());
}
