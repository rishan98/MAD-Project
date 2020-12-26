import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';

class addDetails extends StatefulWidget {
  @override
  _addDetailsState createState() => _addDetailsState();
}

class _addDetailsState extends State<addDetails> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _brand, _type, _year, _reg;

  DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _brand = TextEditingController();
    _type = TextEditingController();
    _year = TextEditingController();
    _reg = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('vehicle');
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
        title: Center(
          child: Text(
            'Add Details',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                          child: Image.network(
                              'https://i.dlpng.com/static/png/6964727_preview.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: TextFormField(
                            controller: _brand,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Brand',
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
                              border: OutlineInputBorder(),
                              labelText: 'Type',
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
                            controller: _year,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Year',
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
                            controller: _reg,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Reg. No.',
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
                  ),
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
    String brand = _brand.text;
    String type = _type.text;
    String year = _year.text;
    String reg = _reg.text;

    Map<String, String> contact = {
      'brand': brand,
      'type': type,
      'year': year,
      'reg': reg,
    };
    _ref.push().set(contact);
  }
}
