//You should separate task.dart and taskData.dart because if you make it one file it make error crash app
//"this error happens when you try to create and read provider immediately"
import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:todoey_using_only_streambuilder/models/task.dart';

class TaskData {
/*  final StreamController<Task> _tasksStream =
      StreamController<Task>.broadcast();
  Stream<Object?> get tasksStream => _tasksStream.stream;*/
  static List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Fruits'),
  ];
/*  static List<Task> getTasks() {
    return [
      Task(name: 'Buy Milk1'),
      Task(name: 'Buy Bread1'),
      Task(name: 'Buy Fruits1'),
    ];
  }*/

  // List<Task> get tasks => tasks;
  void add(String newTask) {
    tasks.add(Task(name: newTask));
  }

  int get taskCount {
    return tasks.length;
  }

  void updateTask(Task taskwantedtochange, bool value) {
    taskwantedtochange.isDone = value;
  }

  // final stream = Stream<Task>.fromIterable([
  //   Task(name: 'Buy Milk'),
  //   Task(name: 'Buy Bread'),
  //   Task(name: 'Buy Fruits'),
  // ]);
  //use get to protect u from access it directly and forget to use methods contains notifyListeners()
  // UnmodifiableListView<Task> get tasks {
  //   List x = tasksStream.toList() as List;
  //   return UnmodifiableListView(x);
  // }

  /*Future<List<Task>> get taskCountStreamss {
    return tasksStream.toList() as Future<List<Task>>;
  }

  Future<int> get taskCountStream async {
    print('5555555555555555${tasksStream.length}');
    return await tasksStream.length;
  }

  void updateTaskStream(Task taskwantedtochange, bool value) {
    taskwantedtochange.isDone = value;
  }

  void deleteTaskStream(Task taskwantedtodelete) {
    List x = tasksStream.toList() as List;
    x.remove(taskwantedtodelete);
  }

  void addStream(String newTask) {
    _tasksStream.add(Task(name: newTask));
    _tasksStream.sink.add(Task(name: 'sadssdsdsdsdsdsd'));
    tasksStream.listen((event) {
      print('adddedddd555555');
    });
    print('addedddd7777777777');
    print(tasksStream.length);
    print(taskCountStreamss);
  }*/

  /* void updateTask(Task taskwantedtochange, bool value) {
    taskwantedtochange.isDone = value;
    notifyListeners(); // Mandatory
  }

  void deleteTask(Task taskwantedtodelete) {
    _tasks.remove(taskwantedtodelete);
    notifyListeners(); // Mandatory
  }

  int get taskCount {
    return _tasks.length;
  }

  void add(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners(); // Mandatory
  }*/
}
