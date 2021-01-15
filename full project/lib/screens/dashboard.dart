import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/branchNetwork.dart';
import 'package:project_autohub/screens/collisions.dart';
import 'package:project_autohub/screens/login.dart';
import 'package:project_autohub/screens/reports.dart';
import 'package:project_autohub/screens/spareParts.dart';
import 'package:project_autohub/screens/vehicleDetail.dart';
import 'package:project_autohub/screens/bookService.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Dashboard',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 80, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return vehicleDetail();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.drive_eta_rounded,
                          size: 40,
                        ),
                        Text(
                          "Vehicle Detail",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return bookService();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          size: 40,
                        ),
                        Text(
                          "Book a Service",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return spareParts();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.brightness_high_rounded,
                          size: 40,
                        ),
                        Text(
                          "Spare Parts",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return collision();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.construction_rounded,
                          size: 40,
                        ),
                        Text(
                          "Collision Repairs",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return reports();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.auto_stories,
                          size: 40,
                        ),
                        Text(
                          "Reports",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: FlatButton(
                    height: 160,
                    minWidth: 170,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return branchNetwork();
                      }));
                    },
                    color: Colors.white60,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.add_location_alt_rounded,
                          size: 40,
                        ),
                        Text(
                          "Branch Network",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                'Autohub',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
                tileColor: Colors.black38,
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.assignment_ind_rounded)),
            ListTile(
                tileColor: Colors.black38,
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.call)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => login()));
        },
        child: Icon(Icons.logout),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
