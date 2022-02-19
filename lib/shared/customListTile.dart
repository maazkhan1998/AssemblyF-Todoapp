import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/models/todoModel.dart';

class CustomListTile extends StatelessWidget {
  final TodoModel todo;

  CustomListTile({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: Text(
          DateFormat("d MMM").format(todo.dueDate),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(todo.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!todo.isCompleted)
            IconButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("todo")
                    .doc(todo.id)
                    .update({"isCompleted": true});
              },
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("todo")
                  .doc(todo.id)
                  .delete();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
