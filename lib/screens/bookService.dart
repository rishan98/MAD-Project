import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';

class bookService extends StatefulWidget {
  @override
  _bookServiceState createState() => _bookServiceState();
}

class _bookServiceState extends State<bookService> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _date, _time, _vehicle, _mileage, _services;

  String _typeSelected = '';
  DatabaseReference _ref;

  void initState() {
    // TODO: implement initState
    super.initState();
    _date = TextEditingController();
    _time = TextEditingController();
    _vehicle = TextEditingController();
    _mileage = TextEditingController();
    _services = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('service');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
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
        title: Text('Book a Service'),
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
              padding: EdgeInsets.fromLTRB(10, 10, 10, 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 50),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _date,
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
                              labelText: 'Booking date',
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
                            controller: _time,
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
                              labelText: 'Time',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a value';
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            'Select Service',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildContactType('Full'),
                              SizedBox(width: 10),
                              _buildContactType('Oil Change'),
                              SizedBox(width: 10),
                              _buildContactType('Engine'),
                              SizedBox(width: 10),
                              _buildContactType('Suspension'),
                              SizedBox(width: 10),
                              _buildContactType('Electrical'),
                              SizedBox(width: 10),
                              _buildContactType('Heating'),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: TextFormField(
                            controller: _vehicle,
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
                            controller: _mileage,
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
                              labelText: 'Mileage',
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
                            controller: _services,
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
                              labelText: 'No.of services have you done?',
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
    String date = _date.text;
    String time = _time.text;
    String vehicle = _vehicle.text;
    String mileage = _mileage.text;
    String services = _services.text;

    Map<String, String> contact = {
      'date': date,
      'time': time,
      'vehicle': vehicle,
      'mileage': mileage,
      'services': services,
      'type': _typeSelected,
    };
    _ref.push().set(contact);
  }
}
