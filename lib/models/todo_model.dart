class TodoModel {
  int? idTodo;
  String? titleTodo;
  String? descriptionTodo;
  String? dateTodo;
  bool? statusTodo;

  TodoModel(
      {this.idTodo,
      this.titleTodo,
      this.descriptionTodo,
      this.dateTodo,
      this.statusTodo});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        idTodo: map['idTodo'],
        titleTodo: map['titleTodo'],
        descriptionTodo: map['descriptionTodo'],
        dateTodo: map['dateTodo'],
        statusTodo: false);
    //statusTodo: map['statusTodo']);
  }
}
