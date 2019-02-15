import 'package:flutter/material.dart';
import 'package:expense_manager/models/group.dart';

class GroupsScreen extends StatefulWidget {
  final List<String> items = ["test", "test2"];

  @override
  GroupsScreeState createState() => new GroupsScreeState();
}

class GroupsScreeState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Dismissible(
                key: UniqueKey(),
                child: new ListTile(
                    title: Text(widget.items[index]),
                    subtitle: Text("test me again agin and new new again")));
          },
          itemCount: widget.items.length),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            widget.items.add("lol");
            setState(() {});
          },
          child: new Icon(Icons.group_add)),
    );
  }
}
