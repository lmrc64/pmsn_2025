import 'package:flutter/material.dart';
import 'package:pmsn_2025/database/task_database.dart';
import 'package:pmsn_2025/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;

  @override
  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder(
        future: database!.SELECT(),
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error de ejecución'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {},
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
