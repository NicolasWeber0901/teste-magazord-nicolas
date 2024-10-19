// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  
  final int id;
  final String title;
  final bool completed;
  final String description;
  final void Function() onClickTask;

  const Task({
    super.key, 
    required this.id, 
    required this.title, 
    required this.completed,
    required this.description,
    required this.onClickTask
  });
  
  @override
  State<Task> createState() => TaskState();

}

class TaskState extends State<Task> {
 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _getIconeTask,
          const SizedBox(width: 10), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getTitulo,
              _getDescricao
            ],
          )
        ],
      ),
    );
  }

  Widget get _getIconeTask => Container(
    height: MediaQuery.of(context).size.height * 0.1,
    width: MediaQuery.of(context).size.width * 0.1,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15)
      ),
      color: Colors.red.shade300,
    ),
    child: GestureDetector(
      onTap: widget.onClickTask,
      child: Icon(
        widget.completed ? Icons.check_circle : Icons.circle,
        color: widget.completed ? Colors.green : Colors.grey.shade300,
        size: 30,
      ),
    ),
  );

  Widget get _getTitulo => Text(
    widget.title,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      decoration: widget.completed ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );

  Widget get _getDescricao => Text(
    widget.description,
    style: TextStyle(
      fontSize: 14      
    ),
  );

}

