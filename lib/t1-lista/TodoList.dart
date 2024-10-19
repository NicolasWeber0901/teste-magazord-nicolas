// ignore_for_file: file_names, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:teste_magazord_nicolas/t1-lista/Task.dart';

class TodoList extends StatefulWidget {
  
  const TodoList({super.key});

  @override
  State<TodoList> createState() => TodoListState();

}

class TodoListState extends State<TodoList> {
  
  ValueNotifier<List<Map<String, dynamic>>> tasks = ValueNotifier([
    {'id': 1, 'title': "Tarefa 1", 'description': "Descrição da Tarefa 1", 'completed': true },
    {'id': 2, 'title': "Tarefa 2", 'description': "Descrição da Tarefa 2", 'completed': true },
    {'id': 3, 'title': "Tarefa 3", 'description': "Descrição da Tarefa 3", 'completed': false },
    {'id': 4, 'title': "Tarefa 4", 'description': "Descrição da Tarefa 4", 'completed': false },
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).shadowColor,
      body: _listTasks,
    );
  }

  Widget get _listTasks => ListView.builder(
    itemCount: tasks.value.length,
    itemBuilder: (context, index) => ValueListenableBuilder(
      valueListenable: tasks,
      builder: (context, value, child) => Task(
        id: tasks.value[index]['id'], 
        title: tasks.value[index]['title'], 
        completed: tasks.value[index]['completed'], 
        description: tasks.value[index]['description'],
        onClickTask: () {
          tasks.value[index]['completed'] = !tasks.value[index]['completed'];
          tasks.notifyListeners();
        },
      ),
    ),
  );
}
