import 'package:expense_manager/resources/strings.dart';
import 'package:expense_manager/resources/icons.dart';

import 'package:expense_manager/widgets/home_screen_drawer.dart';
import 'package:expense_manager/widgets/home_screen_drawer_item.dart';
import 'package:expense_manager/screens/screens.ui_model.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:expense_manager/screens/groups_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title = Strings.home_screen_title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum NavigationItem { groups, expenses }

class _HomeScreenState extends State<HomeScreen> {
  final drawerItems = {
    NavigationItem.groups: new DrawerItem(
        Strings.home_screen_drawer_item_groups,
        AppIcons.home_screen_drawer_item_groups),
    NavigationItem.expenses: new DrawerItem(
        Strings.home_screen_drawer_item_expenses,
        AppIcons.home_screen_drawer_item_expenses)
  };

  NavigationItem _selectedItem = NavigationItem.groups;

  _onSelectItem(NavigationItem item) {
    setState(() {
      _selectedItem = item;
      _getDrawerItemScreen(item);
    });
    Navigator.of(context).pop();
  }

  _getDrawerItemScreen(NavigationItem item) {
    switch (item) {
      case NavigationItem.groups:
        return new GroupsScreen();

      case NavigationItem.expenses:
        return new Text(Strings.home_screen_drawer_item_expenses);
    }
  }

  List<HomeScreenDrawerItem> _getDrawerOptions() {
    var drawerOptions = <HomeScreenDrawerItem>[];
    drawerItems.forEach((key, value) {
      drawerOptions.add(new HomeScreenDrawerItem(
          key == _selectedItem, value, () => _onSelectItem(key)));
    });
    return drawerOptions;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(drawerItems[_selectedItem].title),
      ),
      drawer: HomeScreenDrawer(_getDrawerOptions()),
      body: _getDrawerItemScreen(_selectedItem),
    );
  }
}
