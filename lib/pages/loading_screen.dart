import 'package:flutter/material.dart';

import 'package:todoey/pages/TaskListPage.dart';

import 'package:todoey/entrils/files_operations.dart';

class LoadingScreen extends StatefulWidget {
  static final LoadingScreenID = '0';
  final CounterStorage storage;

  LoadingScreen({this.storage});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        if (value != null) {
          for (String task in value) {
            taskList.add(Task(name: task));
          }
        }
      });

      Navigator.pushNamed(context, TaskListPage.TaskListPageID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
