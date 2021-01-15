import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/dashboard.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _uname, _pword;
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _uname = TextEditingController();
    _pword = TextEditingController();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('user')
        .orderByChild('uname');
  }

  @override
  Widget build(BuildContext context, {Map contact}) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.admin_panel_settings),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return;
            }));
          },
        ),
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/img/car1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Text(
                'Autohub',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10, 50, 10, 40),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.tealAccent,
                    fontFamily: "Pacifico",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Column(
                    key: _formKey,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
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
                              prefixIcon: Icon(
                                Icons.account_circle,
                                size: 30,
                              ),
                              labelText: 'Email',
                              focusColor: Colors.blue),
                          controller: _uname,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          obscureText: true,
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
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                size: 30,
                              ),
                              labelText: 'Password',
                              fillColor: Colors.white),
                          controller: _pword,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(100, 10, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.deepPurple,
                              child: Text('Login'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                if (_uname == ['uname'] &&
                                    _pword == ['pword']) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return dashboard();
                                  }));
                                }
                              },
                            ),
                          ),
                        ],
                      )
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
