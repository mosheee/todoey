import 'package:flutter/material.dart';
import 'package:flutter_app/task.dart';

class AddScreen extends StatelessWidget {
  final Function addCallBack;
  AddScreen(this.addCallBack);
  String newTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'New Task',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent),
          ),
          TextField(
            autofocus: true,
            onChanged: (String value) {
              newTitle = value;
              print(newTitle);
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            onPressed: addCallBack(newTitle),
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
