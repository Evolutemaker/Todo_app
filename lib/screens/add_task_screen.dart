import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? taskText;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF080808),
        border: Border.all(width: 0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
            color: Color(0xFF1e1e1e),
            borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(25.0, 15.0),
              topLeft: Radius.elliptical(25.0, 15.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            const Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
            TextField(
              onChanged: (value) {
                taskText = value;
              },
              autocorrect: true,
              maxLines: 1,
              maxLength: 25,
              cursorColor: Colors.white,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskText!);
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Color(0xFF1e1e1e),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
