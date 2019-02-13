import 'package:flutter/material.dart';
import 'package:expense_manager/screens/screens.ui_model.dart';
import 'package:expense_manager/resources/numbers.dart';

class HomeScreenDrawerItem extends StatelessWidget {
  final DrawerItem drawerItem;
  final bool selected;
  final void Function() onTap;

  HomeScreenDrawerItem(this.selected, this.drawerItem, this.onTap);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(drawerItem.icon),
      title: new Text(drawerItem.title,
          style: new TextStyle(
              fontSize: Numbers.drawer_item_font_size,
              fontWeight: FontWeight.w400)),
      selected: selected,
      onTap: onTap,
    );
  }
}
