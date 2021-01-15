import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';
import 'package:project_autohub/screens/signIn.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _uname, _pword;

  DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _uname = TextEditingController();
    _pword = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('user');
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
              return signIn();
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: TextFormField(
                            controller: _uname,
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
                              labelText: 'uname',
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
                            controller: _pword,
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
                              labelText: 'pword',
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
    String uname = _uname.text;
    String pword = _pword.text;

    Map<String, String> contact = {
      'uname': uname,
      'pword': pword,
    };
    _ref.push().set(contact);
  }
}
