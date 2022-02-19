import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/todoModel.dart';

import 'customListTile.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection("todo")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());

        if (snapshot.data!.docs.isEmpty)
          return Center(
            child: Text("No todo task"),
          );

        return ListView.separated(
            itemBuilder: (ctx, i) {
              final task =
                  TodoModel.fromDocumentSnapshot(snapshot.data!.docs[i]);
              return CustomListTile(todo: task);
            },
            separatorBuilder: (ctx, i) => SizedBox(
                  height: 5,
                ),
            itemCount: snapshot.data!.docs.length);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
