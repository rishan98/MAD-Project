import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class repairHistory extends StatefulWidget {
  @override
  _repairHistoryState createState() => _repairHistoryState();
}

class _repairHistoryState extends State<repairHistory> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('collision')
        .orderByChild('insuarance');
  }

  Widget _buildContactItem({Map contact}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(30, 20, 10, 50),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 350,
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
                'Insuarance       :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['insuarance'],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                'Type                  :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['type'],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                'Contact No.     :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  contact['contact'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.clip,
                ),
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
                'Advisor            :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['advisor'],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                'Description     :',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  contact['description'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
          'Repair History',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      //backgroundColor: Colors.blueGrey[900],
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
}
