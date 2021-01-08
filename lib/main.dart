import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/entrils/files_operations.dart';
import 'pages/TaskListPage.dart';
import 'pages/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: LoadingScreen(storage: CounterStorage()),
        routes: {
          LoadingScreen.LoadingScreenID: (context) => LoadingScreen(),
          TaskListPage.TaskListPageID: (context) => TaskListPage()
        },
      ),
    );
  }
}
