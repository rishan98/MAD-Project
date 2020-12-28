import 'package:flutter/material.dart';

class spareParts01 extends StatefulWidget {
  @override
  _spareParts01State createState() => _spareParts01State();
}

class _spareParts01State extends State<spareParts01> {
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
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 30),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  Container(
                      child: Image(
                    image: AssetImage('lib/img/p1.PNG'),
                  )),
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
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: Text(
                      'Good condition. Price can be negotiable.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: Text(
                      'Call : 0773216549',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.brown),
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
