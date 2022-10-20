import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class view_component extends StatelessWidget {
  const view_component({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentref =
        FirebaseFirestore.instance.collection("students");
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Card(
                        color: Colors.black,
                        child: Center(
                          child: Text("${snapshot.data!.docs[i]['user_name']}",
                              style: TextStyle(backgroundColor: Colors.white)),
                        )),
                    Card(
                        borderOnForeground: true,
                        color: Colors.blueGrey,
                        child: Center(
                            child:
                                Text("${snapshot.data!.docs[i]['user_id']}"))),
                    Card(
                      color: Color.fromARGB(255, 120, 130, 120),
                      child: Center(
                          child:
                              Text("${snapshot.data!.docs[i]['user_course']}")),
                    ),
                  ],
                );
              },
            ),
          );
        },
        future: studentref.get(),
      ),
    );
  }
}
