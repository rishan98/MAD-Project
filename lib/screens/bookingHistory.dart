import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class bookingHistory extends StatefulWidget {
  @override
  _bookingHistoryState createState() => _bookingHistoryState();
}

class _bookingHistoryState extends State<bookingHistory> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('service')
        .orderByChild('date');
  }

  Widget _buildContactItem({Map contact}) {
    Color typeColor = getTypeColor(contact['type']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(30, 20, 10, 50),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Date              :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['date'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Time             :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['time'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Mileage        :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['mileage'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Vehicle         :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['vehicle'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Services       :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['services'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              Text(
                'Service Type   =>',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              RaisedButton(
                color: typeColor,
                child: Text(
                  contact['type'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking History',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
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

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Full') {
      color = Colors.brown;
    }
    if (type == 'Engine') {
      color = Colors.green;
    }
    if (type == 'Oil Change') {
      color = Colors.blue;
    }
    if (type == 'Suspension') {
      color = Colors.orange;
    }
    if (type == 'Electrical') {
      color = Colors.grey;
    }
    if (type == 'Heating') {
      color = Colors.purple;
    }
    return color;
  }
}
