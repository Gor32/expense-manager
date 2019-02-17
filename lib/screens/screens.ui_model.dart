import 'package:flutter/material.dart';
import  'package:expense_manager/models/group.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class GroupItem {
  Widget title;
  Widget subtitle;
  Group group;

  GroupItem(this.group){
    this.title = new Text(group.name);
    this.subtitle = new Text(group.description);
  }

  Widget toTile() {
    return new Container(
      child: new ListTile(title: title, subtitle: subtitle),
    );
    //return new ListTile(title: title, subtitle: subtitle);
  }
}
