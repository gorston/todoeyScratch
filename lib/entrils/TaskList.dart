import 'package:flutter/material.dart';
import 'package:todoey/pages/TaskListPage.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final int index;
  TaskTile(
    this.index,
  );
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Provider.of<TasksData>(context).tasks[index].name,
        style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 25,
            decoration:
                Provider.of<TasksData>(context).tasks[index].isdone == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: Provider.of<TasksData>(context).tasks[index].isdone,
        onChanged: (value) {
          context.read<TasksData>().toggleDone(index);
          context.read<TasksData>().removeTask(index);
        }
        // toggleCheckbox;
        ,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
