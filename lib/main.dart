import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/add_screen.dart';
import 'listTile.dart';
import 'task.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [Task(title: 'do something'), Task(title: 'just do it')];
  String newTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.list),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TodoeyEx',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('12 tasks', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTileTask(
                        title: tasks[index].title,
                        isCheck: tasks[index].isChecked,
                        checkBoxCllBack: (bool checkbox) {
                          setState(() {
                            tasks[index].isChecked = checkbox;
                          });
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (context) => AddScreen((value) {
                newTitle = value ;
                  Navigator.pop(context);
              }));
          if(newTitle != null){
            setState(() {
              tasks.add(Task(title: newTitle));
            });
          }
        },
      ),
    );
  }
}
// callback take the value put it in the input of the callback and do something with that
