import 'package:flutter/material.dart';
import 'package:myapp/component/add.dart';
import 'package:myapp/component/delete.dart';
import 'package:myapp/component/edit.dart';
import 'package:myapp/component/view.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
                bottom: TabBar(
              tabs: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.update)),
                IconButton(onPressed: () {}, icon: Icon(Icons.read_more)),
              ],
            )),
            body: TabBarView(
              children: [
                add_component(),
                delete_component(),
                edit_component(),
                view_component()
              ],
            )));
  }
}
