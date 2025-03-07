import 'dart:ffi';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn_2025/database/task_database.dart';
import 'package:pmsn_2025/models/todo_model.dart';
import 'package:pmsn_2025/utils/global_values.dart';

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
      body: ValueListenableBuilder(
        valueListenable: GlobalValues.updateList,
        builder: (context, value, widget) {
          return FutureBuilder(
            future: database!.SELECT(),
            builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                  padding: EdgeInsets.all(15),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var task = snapshot.data![index];

                    return Container(
                      decoration: BoxDecoration(color: Colors.greenAccent),
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
                                return Icon(Icons.close);
                              }
                            }),
                          ),
                          Text(task.descriptionTodo!),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    conTitle.text = task.titleTodo!;
                                    conDescription.text = task.descriptionTodo!;
                                    conDate.text = task.dateTodo!;
                                    conStatus.text =
                                        task.statusTodo!.toString();
                                    _dialogBuilder(context, task.idTodo!);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 35,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    database!
                                        .DELETE('todo', task.idTodo!)
                                        .then((value) {
                                      if (value > 0) {
                                        GlobalValues.updateList.value =
                                            !GlobalValues.updateList.value;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 35,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, [int id = 0]) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: id == 0 ? Text('Add Task') : Text('Edit Task'),
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
                  Divider(),
                  ElevatedButton(
                      onPressed: () {
                        if (id == 0) {
                          database!.INSERT('todo', {
                            'titleTodo': conTitle.text,
                            'descriptionTodo': conDescription.text,
                            'dateTodo': conDate.text,
                            'statusTodo': false
                          }).then(
                            (value) {
                              if (value > 0) {
                                GlobalValues.updateList.value =
                                    !GlobalValues.updateList.value;
                                ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.success,
                                        title: 'Mensaje de la App',
                                        text:
                                            'Datos insertados correctamente'));
                              }
                            },
                          );
                        } else {
                          database!.UPDATE('todo', {
                            'idTodo': id,
                            'titleTodo': conTitle.text,
                            'descriptionTodo': conDescription.text,
                            'dateTodo': conDate.text,
                            'statusTodo': false
                          }).then(
                            (value) {
                              if (value > 0) {
                                GlobalValues.updateList.value =
                                    !GlobalValues.updateList.value;
                                ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.success,
                                        title: 'Mensaje de la App',
                                        text:
                                            'Datos actualizados correctamente'));
                              }
                            },
                          );
                        }

                        conTitle.text = '';
                        conDescription.text = '';
                        conDate.text = '';
                        conStatus.text = '';

                        Navigator.pop(context);
                      },
                      child: Text('Guardar'))
                ],
              ),
            ),
          );
        });
  }
}
