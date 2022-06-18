import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            //Puts modal above keyboard
            isScrollControlled: true, //makes modal full height
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFF1e1e1e),
        child: const Icon(
          Icons.add_outlined,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 20.0, left: 20.0, right: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ToDo App',
                  style: TextStyle(
                      color: Color(0xFF121212),
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0),
                ),
                const SizedBox(height: 5),
                Text(
                  'Tasks left: ${Provider.of<TaskData>(context).taskCount}',
                  style: const TextStyle(
                      color: Color(0xFF121212),
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  color: Color(0xFF121212),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(25.0, 15.0),
                    topLeft: Radius.elliptical(25.0, 15.0),
                  )),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
