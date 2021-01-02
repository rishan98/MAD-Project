import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_autohub/screens/addDetails.dart';

class vehicleDetail extends StatefulWidget {
  @override
  _vehicleDetailState createState() => _vehicleDetailState();
}

class _vehicleDetailState extends State<vehicleDetail> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('vehicle')
        .orderByChild('brand');
  }

  Widget _buildContactItem({Map contact}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(30, 40, 10, 50),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 550,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(
                'https://d1ypc8j62c29y8.cloudfront.net/fullsize/5/4/6/f72e9201bf80a8e7ac33cc4c40a8c16b375c7645.png'),
          ),
          Row(
            children: [
              Icon(
                Icons.car_rental,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              Text(
                'Brand       :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['brand'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Text(
                'Type         :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['type'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Text(
                'Year         :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['year'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              Icon(
                Icons.circle,
                size: 10,
              ),
              Text(
                'Reg. No.  :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['reg'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
        title: Center(
          child: Text(
            'Vehicle Details',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                'Autohub',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
                tileColor: Colors.black38,
                title: Text(
                  'Add Details',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return addDetails();
                  }));
                },
                leading: Icon(Icons.add)),
            ListTile(
                tileColor: Colors.black38,
                title: Text(
                  'Delete Details',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    return color;
  }
}
