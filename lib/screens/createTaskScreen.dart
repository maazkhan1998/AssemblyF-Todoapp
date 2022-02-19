import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/shared/customButton.dart';
import 'package:todoapp/shared/customTextField.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController titleController = TextEditingController();

  DateTime? dueDate;

  selectDate() async {
    final tempDate = await showDatePicker(
        context: context,
        initialDate: dueDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    if (tempDate != null) {
      setState(() => dueDate = tempDate);
    }
  }

  onAddTask() async {
    try {
      await FirebaseFirestore.instance.collection("todo").add({
        "titleTask": titleController.text.trim(),
        "dueDate": dueDate,
        "userId": FirebaseAuth.instance.currentUser!.uid,
        "isCompleted": false
      });

      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create todo task"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTextField(controller: titleController, hintText: "Title"),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color(0xFF000000).withOpacity(0.4),
                      width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dueDate == null
                      ? "Select Date"
                      : DateFormat("dd/MMM/yyyy").format(dueDate!)),
                  IconButton(
                      onPressed: selectDate,
                      icon: const Icon(Icons.calendar_today))
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          CustomButton(onPress: onAddTask, child: const Text("Add Task")),
    );
  }
}
