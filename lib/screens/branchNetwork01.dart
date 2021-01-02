import 'package:flutter/material.dart';
import 'package:project_autohub/screens/branchNetwork02.dart';

class branchNetwork01 extends StatefulWidget {
  @override
  _branchNetwork01State createState() => _branchNetwork01State();
}

class _branchNetwork01State extends State<branchNetwork01> {
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
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/dark.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 250),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Write your feedback', focusColor: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return branchNetwork02();
          }));
        },
        label: Text('Send'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
