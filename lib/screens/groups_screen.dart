import 'package:flutter/material.dart';
import 'package:expense_manager/models/group.dart';
import 'package:expense_manager/resources/icons.dart';
import 'package:expense_manager/widgets/group_details_widget.dart';

import "package:expense_manager/screens/screens.ui_model.dart";

import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsScreen extends StatefulWidget {
  final List<GroupItem> items = [
    new GroupItem(new Group(name: '12', description: '12')),
    new GroupItem(new Group(name: '13', description: '12')),
    new GroupItem(new Group(name: '14', description: '12'))
  ];

  @override
  GroupsScreeState createState() => new GroupsScreeState();
}

class GroupsScreeState extends State<GroupsScreen> {
  SlidableController slidableController;

  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.grey : Colors.blue;
    });
  }

  @protected
  void initState() {
    slidableController = new SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return new ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        final Axis slidableDirection =
            direction == Axis.horizontal ? Axis.vertical : Axis.horizontal;

        return _getSlidableWithLists(context, index, slidableDirection);
      },
      itemCount: widget.items.length,
    );
  }

  IconSlideAction _getDeleteIconSlider(BuildContext context, int index) {
    return new IconSlideAction(
      caption: 'Delete',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => _deleteGroup(context, index),
    );
  }

  void _deleteGroup(BuildContext context, int index) {
    _showSnackBar(context, 'Dimiss Delete');
    setState(() {
      widget.items.removeAt(index);
    });
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text(text)));
  }

  Widget _getSlidableWithLists(
      BuildContext context, int index, Axis direction) {
    final GroupItem item = widget.items[index];
    //final int t = index;
    return new Slidable(
      key: new Key(item.group.name),
      controller: slidableController,
      direction: direction,
      slideToDismissDelegate: new SlideToDismissDrawerDelegate(
        onDismissed: (actionType) => _deleteGroup(context, index),
      ),
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child: item.toTile(),
      actions: <Widget>[_getDeleteIconSlider(context, index)],
      secondaryActions: <Widget>[_getDeleteIconSlider(context, index)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new OrientationBuilder(
          builder: (context, orientation) => _buildList(
              context,
              orientation == Orientation.portrait
                  ? Axis.vertical
                  : Axis.horizontal),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: _fabColor,
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new GroupDetailsWidget();
          }));
          setState(() {});
        },
        child: _rotationAnimation == null
            ? Icon(AppIcons.groups_screen_button_add)
            : RotationTransition(
                turns: _rotationAnimation,
                child: Icon(AppIcons.groups_screen_button_add),
              ),
      ),
    );
  }
}
