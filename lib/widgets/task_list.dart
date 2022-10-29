import 'package:flutter/material.dart';
import 'package:todoey_using_only_streambuilder/models/task_data.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  //use provider instead passing values
  List<Task> tasks = TaskData.tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text('${tasks[index].name}'),
          trailing: Checkbox(
              value: tasks[index].isDone,
              onChanged: (bool? value) {
                TaskData().updateTask(tasks[index], value!);
                setState(() {});
              }),
        );
      },
    );
    //user ListView.builder unKnown number of ListTile or Infinite numbers
/*
    return StreamBuilder<TaskData>(
        stream: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final currentTask = snapshot.data;
            if (currentTask == null) {
              return const Center(
                child: Text('No Tasks'),
              );
            }
            return Scaffold(body: Text('$currentTask'));
          }
          return const Scaffold(
            body: Center(
              child: Text('Something is wrong'),
            ),
          );
        });
*/
    /*return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 0.5),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 ||
            index == (Provider.of<TaskData>(context).taskCount) + 1) {
          return Container();
        }
        final currentTask = Provider.of<TaskData>(context).tasks[index - 1];
        return ListTile(
          onLongPress: () {
            Provider.of<TaskData>(context, listen: false)
                .deleteTask(currentTask);
          },
          //title: Text((context.read<Task>().tasks[index].name!)),
          title: Text(
            currentTask.name!,
            style: TextStyle(
              decoration:
                  currentTask.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          //Error soled by toString() -->'String Function(dynamic)' can't be assigned to the parameter type 'String'.
          trailing: Checkbox(
            value: currentTask
                .isDone, //(newText) => context.watch<Task>().tasks[index].isDone,
            onChanged: (bool? value) {
              // Provider.of<TaskData>(context).updateTask(<TaskData>(context).tasks[index]);
              Provider.of<TaskData>(context, listen: false).updateTask(
                  currentTask,
                  value!); // listen: false  Mandatory or will not update list.
              // setState(() {
              //   Provider.of<TaskData>(context).tasks[index].isDone = value!;
              // });
            },
          ),
          // title: widget.tasks![index].name!,
          // checkedBox: widget.tasks![index].isDone,
        );
      },
      //mandatory -->Crash App
      //itemCount: context.watch<Task>().tasks.length, //int.parse(().toString()),
      itemCount: (Provider.of<TaskData>(context).taskCount) +
          2, //int.parse(().toString()),
      //Error sovled by toString() -->error: The argument type 'int Function(dynamic)' can't be assigned to the parameter type 'int?'.
    );*/
  }
}
