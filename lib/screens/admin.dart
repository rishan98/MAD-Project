import 'package:flutter/material.dart';
import 'package:project_autohub/screens/bookingHistory.dart';
import 'package:project_autohub/screens/login.dart';
import 'package:project_autohub/screens/repairHistory.dart';
import 'package:project_autohub/screens/vehicleDetail.dart';

class admin extends StatefulWidget {
  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Admin Panel',
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // ignore: missing_required_param
              child: FlatButton(
                height: 100,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return vehicleDetail();
                  }));
                },
                color: Colors.white60,
                child: Center(
                  child: Text(
                    'Vehicle Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // ignore: missing_required_param
              child: FlatButton(
                height: 100,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return bookingHistory();
                  }));
                },
                color: Colors.white60,
                child: Center(
                  child: Text(
                    'Booking Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // ignore: missing_required_param
              child: FlatButton(
                height: 100,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return repairHistory();
                  }));
                },
                color: Colors.white60,
                child: Center(
                  child: Text(
                    'Repair Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // ignore: missing_required_param
              child: FlatButton(
                height: 100,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
                color: Colors.white60,
                child: Center(
                  child: Text(
                    'Other Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => login()));
        },
        child: Icon(Icons.logout),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
