import 'package:flutter/material.dart';


class ListTileTask extends StatelessWidget {
  final Function checkBoxCllBack ;
  final String title ;
  final bool isCheck ;
  ListTileTask({this.title,this.isCheck,this.checkBoxCllBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: isCheck ? TextStyle(decoration: TextDecoration.lineThrough) : null),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        autofocus: true,
        focusColor: Colors.black,
        value: isCheck,
        onChanged: checkBoxCllBack
      ),
    );
  }
}
