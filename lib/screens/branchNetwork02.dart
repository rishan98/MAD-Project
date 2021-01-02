import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';

class branchNetwork02 extends StatefulWidget {
  @override
  _branchNetwork02State createState() => _branchNetwork02State();
}

class _branchNetwork02State extends State<branchNetwork02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Branch Network',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/dark.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            'Sent successfully.',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return dashboard();
          }));
        },
        label: Text('Home'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
