import 'package:flutter/material.dart';
import 'package:project_autohub/screens/login.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
