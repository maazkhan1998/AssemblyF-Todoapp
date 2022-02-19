import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:todoapp/models/todoModel.dart';

import 'customListTile.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection("todo")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
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
}
