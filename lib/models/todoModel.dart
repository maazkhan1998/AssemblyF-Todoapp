import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String id;
  final String userId;
  final String title;
  final DateTime dueDate;
  final bool isCompleted;

  TodoModel(
      {required this.userId,
      required this.dueDate,
      required this.isCompleted,
      required this.title,
      required this.id});

  factory TodoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return TodoModel(
        userId: doc["userId"],
        dueDate: doc["dueDate"].toDate(),
        isCompleted: doc["isCompleted"],
        title: doc["titleTask"],
        id: doc.id);
  }
}
