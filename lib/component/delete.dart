import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class delete_component extends StatefulWidget {
  const delete_component({super.key});

  @override
  State<delete_component> createState() => _delete_componentState();
}

class _delete_componentState extends State<delete_component> {
  TextEditingController username = TextEditingController();
  TextEditingController userid = TextEditingController();
  TextEditingController usercourse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Student information",
                style: TextStyle(fontSize: 30, color: Colors.redAccent),
              ),
              SizedBox(
                height: 20,
              ),
              Text("user name",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 123, 136, 158))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3)))),
              Text("user id",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 123, 136, 158))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: userid,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3)))),
              Text("user course",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 123, 136, 158))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: usercourse,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3)))),
              TextButton(
                  onPressed: () async {
                    final FirebaseFirestore _firestore =
                        FirebaseFirestore.instance;
                    final CollectionReference _mainCollection =
                        _firestore.collection('students');

                    DocumentReference DR = _mainCollection
                        .doc()
                        .collection('students')
                        .doc('0X9WTG5f3MI8aBIWfnid');
                    await DR
                        .delete()
                        .whenComplete(
                            () => print('Note item deleted from the database'))
                        .catchError((e) => print(e));
                  },
                  child: Text("Delete data"))
            ],
          ),
        )
      ]),
    );
  }
}
