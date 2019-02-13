import 'package:flutter/material.dart';
import 'home_screen_drawer_item.dart';

class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer(this.drawerOptions);

  final List<HomeScreenDrawerItem> drawerOptions;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text(
                "example",
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              accountEmail: new Text(
                "example@gmail.com",
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              )),
          new Column(children: drawerOptions)
        ],
      ),
    );
  }
}
