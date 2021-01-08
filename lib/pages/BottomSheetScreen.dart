import 'package:flutter/material.dart';
import 'package:todoey/entrils/files_operations.dart';
import 'package:provider/provider.dart';
import 'TaskListPage.dart';

class BottomSheetScreen extends StatelessWidget {
  String text;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Colors.grey.shade600,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'To-Do',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    onChanged: (value) {
                      text = value;
                    },
                    onSubmitted: (value) {
                      if (text != null) {
                        context.read<TasksData>().addTask(text);
                        CounterStorage().writeCounter(text);
                      } else {
                        print('error');
                      }

                      Navigator.pop(context);
                    },
                    autofocus: true,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    if (text != null) {
                      context.read<TasksData>().addTask(text);
                      CounterStorage().writeCounter(text);
                      Navigator.pop(context);
                    } else {
                      print('error');
                    }
                  },
                  child: Text('Add'),
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
