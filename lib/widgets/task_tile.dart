import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.onLongPress})
      : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback onLongPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      height: 52,
      child: ListTile(
        onLongPress: onLongPress,
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Colors.white,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          side: const BorderSide(color: Colors.white, width: 1.2),
          value: isChecked,
          onChanged: checkboxCallback,
          checkColor: const Color(0xFF1E1E1E),
          activeColor: Colors.white,
          //hoverColor: Colors.white,
          //focusColor: Colors.white,
        ),
      ),
    );
  }
}
