import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/todoModel.dart';
import 'package:todoapp/screens/createTaskScreen.dart';
import 'package:todoapp/shared/customListTile.dart';
import 'package:todoapp/shared/futureBuilder.dart';
import 'package:todoapp/shared/streamBuilderWidget.dart';

import 'loginScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin {

  late final TabController tabController;

   @override
   initState(){
     tabController=TabController(length: 2,vsync: this);
     super.initState();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children:[
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text("Future Builder",style: TextStyle(
                    color:Colors.black,fontSize: 20
                  ),),
                ),
                Tab(
                  child: Text("Stream Builder",style: TextStyle(
                    color:Colors.black,fontSize: 20
                  ),),
                )
              ],
            ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children:const [
                FutureBuilderWidget(),
                StreamBuilderWidget()
              ],
            ),
          )
          ],
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const CreateTaskScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
