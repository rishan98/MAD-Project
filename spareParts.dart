import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/spareParts01.dart';

class spareParts extends StatefulWidget {
  @override
  _sparePartsState createState() => _sparePartsState();
}

class _sparePartsState extends State<spareParts> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('spare')
        .orderByChild('sname');
  }

  Widget _buildContactItem({Map contact}) {
    return Container(
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
                              contact['sname'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              contact['price'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )),
                        Container(
                            child: Text(
                          contact['availability'],
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
            ],
          ),
        ],
      ),
    );
  }

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
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
    );
  }
}
