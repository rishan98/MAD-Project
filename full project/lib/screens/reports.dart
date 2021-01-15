import 'package:flutter/material.dart';
import 'package:project_autohub/screens/bookingHistory.dart';
import 'package:project_autohub/screens/repairHistory.dart';

class reports extends StatefulWidget {
  @override
  _reportsState createState() => _reportsState();
}

class _reportsState extends State<reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reports',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.black87,
        ),
        //backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/img/dark.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 80, 10, 80),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  children: [
                    Container(
                      child: FlatButton(
                        height: 50,
                        minWidth: 400,
                        textColor: Colors.white,
                        color: Colors.black54,
                        child: Text('Booking History'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return bookingHistory();
                          }));
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: FlatButton(
                        height: 50,
                        minWidth: 400,
                        textColor: Colors.white,
                        color: Colors.black54,
                        child: Text('Repair History'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return repairHistory();
                          }));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
