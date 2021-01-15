import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/admin.dart';
import 'package:project_autohub/screens/dashboard.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  final auth = FirebaseAuth.instance;
  // ignore: deprecated_member_use
  FirebaseUser user1;
  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) => setState(() {
                            _email = value.trim();
                          }),
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
                          onChanged: (value) => setState(() {
                            _password = value.trim();
                          }),
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
                                if (_email == 'rishan@gmail.com' &&
                                    _password == '123456') {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return admin();
                                  }));
                                }
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return dashboard();
                                }));
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.deepPurple,
                              child: Text('SignUp'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                var a = auth.signInWithEmailAndPassword(
                                    email: _email, password: _password);

                                if (a != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => dashboard()));
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
