import 'package:flutter/material.dart';
import 'package:project_autohub/screens/spareParts01.dart';

class spareParts extends StatefulWidget {
  @override
  _sparePartsState createState() => _sparePartsState();
}

class _sparePartsState extends State<spareParts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spare Parts',
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
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    children: [
                      Container(
                          child: Image(
                        image: AssetImage('lib/img/p1.PNG'),
                      )),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                '14" Alloy Wheels',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                'LKR 30000',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          Container(
                              child: Text(
                            'Available',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          )),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black45,
                              child: Text('View'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return spareParts01();
                                }));
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    children: [
                      Container(
                          child: Image(
                        image: AssetImage('lib/img/p2.PNG'),
                      )),
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                'Side Mirrors',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                'LKR 50000',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )),
                          Container(
                              child: Text(
                            'Available',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          )),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.black45,
                              child: Text('View'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
