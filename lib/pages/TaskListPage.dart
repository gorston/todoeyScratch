import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todoey/entrils/files_operations.dart';
import 'BottomSheetScreen.dart';
import 'package:todoey/entrils/TaskList.dart';

List<Task> taskList = [];

class TaskListPage extends StatelessWidget {
  static final TaskListPageID = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => BottomSheetScreen());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.lightBlueAccent,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text(
                    'TODOyay',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Number of tasks - ${Provider.of<TasksData>(context).tasks.length}',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(18),
                color: Colors.white,
                child: Provider.of<TasksData>(context).tasks.length == 0
                    ? Center(
                        child: Text(
                        'No tasks yet',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return TaskTile(index);
                        },
                        itemCount:
                            Provider.of<TasksData>(context).tasks.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Task {
  final String name;
  bool isdone;

  Task({this.name, this.isdone = false});
}

class TasksData extends ChangeNotifier {
  List<Task> tasks = taskList;

  void toggleDone(index) {
    tasks[index].isdone = !tasks[index].isdone;
    notifyListeners();
  }

  void addTask(String text) {
    if (text != null) {
      tasks.add(Task(
        name: text,
      ));

      notifyListeners();
    } else {
      print('no text provided');
    }
  }

  removeTask(int index) {
    Timer(Duration(seconds: 5), () {
      if (tasks[index].isdone == true) {
        tasks.removeAt(index);
        CounterStorage().delete(index);
      }
      notifyListeners();
    });
  }
}
