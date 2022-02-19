import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text("Task title"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.check,color: Colors.green,),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.delete,color: Colors.red,),
                  )
                ],
              ),
            );
  }
}