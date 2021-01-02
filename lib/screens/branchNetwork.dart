import 'package:flutter/material.dart';
import 'package:project_autohub/screens/branchNetwork01.dart';

class branchNetwork extends StatefulWidget {
  @override
  _branchNetworkState createState() => _branchNetworkState();
}

class _branchNetworkState extends State<branchNetwork> {
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
      //backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/dark.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: ListTile(
                        title: Text(
                          'Hyde Park Corner',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.circle,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(35, 0, 10, 0),
                    child: ListTile(
                        title: Text(
                          '0716543210',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        leading: Icon(
                          Icons.call,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(35, 0, 10, 0),
                    child: ListTile(
                        title: Text(
                          'No.132,hyde park,colombo 02.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        leading: Icon(
                          Icons.add_location_alt_rounded,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.fromLTRB(35, 0, 10, 40),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black12,
                      child: Text('Send Feedback'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return branchNetwork01();
                        }));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
