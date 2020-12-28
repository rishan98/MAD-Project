import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';

class collision extends StatefulWidget {
  @override
  _collisionState createState() => _collisionState();
}

class _collisionState extends State<collision> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _insuarance, _type, _advisor, _description, _con;
  DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _insuarance = TextEditingController();
    _type = TextEditingController();
    _advisor = TextEditingController();
    _description = TextEditingController();
    _con = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('collision');
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Success'),
      content: Text('success'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return dashboard();
            }));
          },
          child: Text('OK'),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Collision Repairs'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/dark.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 320),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: TextFormField(
                            controller: _insuarance,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Insuarance Company',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _type,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Vehicle Type',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _advisor,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Service Advisor',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _description,
                            maxLines: 6,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _con,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Contact Number',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                });
            saveContact();
          }
        },
        label: Text('Confirm'),
        backgroundColor: Colors.pink,
      ),
    );
  }

  void saveContact() {
    String insuarance = _insuarance.text;
    String type = _type.text;
    String advisor = _advisor.text;
    String description = _description.text;
    String con = _con.text;

    Map<String, String> contact = {
      'insuarance': insuarance,
      'type': type,
      'advisor': advisor,
      'description': description,
      'contact': con,
    };
    _ref.push().set(contact);
  }
}
