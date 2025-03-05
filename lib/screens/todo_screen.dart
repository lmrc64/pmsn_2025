import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn_2025/database/task_database.dart';
import 'package:pmsn_2025/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDescription = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStatus = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_task,
        ),
        onPressed: () {
          _dialogBuilder(context);
        },
      ),
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: FutureBuilder(
        future: database!.SELECT(),
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var task = snapshot.data![index];

                return Container(
                  height: 150,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(task.titleTodo!),
                        subtitle: Text(task.dateTodo!),
                        trailing: Builder(builder: (context) {
                          //Un Builder nos retorna un widget de acuerdo a una l[ogica que se implemente
                          if (task.statusTodo!) {
                            return Icon(Icons.check);
                          } else {
                            return Icon(Icons.delete);
                          }
                        }),
                      ),
                      Text(task.descriptionTodo!),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: Container(
              height: 280,
              width: 300,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: conTitle,
                    decoration: InputDecoration(
                      hintText: 'Titulo de la tarea',
                    ),
                  ),
                  TextFormField(
                    controller: conDescription,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Descripcion de la tarea',
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: conDate,
                    decoration: InputDecoration(
                      hintText: 'Fecha de la tarea',
                    ),
                    onTap: () async {
                      DateTime? dateTodo = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (dateTodo != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(dateTodo);
                        setState(() {
                          conDate.text = formattedDate;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    controller: conStatus,
                    decoration: InputDecoration(
                      hintText: 'Estatus de la tarea',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
