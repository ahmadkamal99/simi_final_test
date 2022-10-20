import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class add_component extends StatefulWidget {
  const add_component({super.key});

  @override
  State<add_component> createState() => _add_componentState();
}

class _add_componentState extends State<add_component> {
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
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
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
                  onPressed: () {
                    CollectionReference studentRef =
                        FirebaseFirestore.instance.collection("students");
                    studentRef.add({
                      'user_id': userid.text,
                      'user_name': username.text,
                      'user_course': usercourse.text
                    });
                  },
                  child: Text("Add data"))
            ],
          ),
        )
      ]),
    );
  }
}
