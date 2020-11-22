

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  DatabaseReference user;
  DatabaseReference mess;
  @override
  _HomeState createState() => _HomeState();
}
void sendata()
{
  final _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference=FirebaseDatabase.instance.reference().child("user");




  // _databaseReference.push().set({
  //
  //   "name":"nguyen ",
  //
  //   "date":"11-11-2020",
  //   "content":"thiss is posst",
  //   "img":["https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182","https://tse4.mm.bing.net/th?id=OIP.49CH_m8xcY3b6stGkMkG2AHaEO&pid=Api&P=0&w=317&h=182"],
  //   "like":"15",
  //   "comment":"10"
  // });
  _databaseReference.child("user").push().set({

    "name":"nguyen ",
    "email":"nguyen@gmail.com",
    "date":"11-11-2020",
    "mess":[{
      "senderId": "1",
      "message": "Hi Marti! do you have already reports?",
    }],

  });


}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("add data"),

        )
      ],
    );
  }
}
