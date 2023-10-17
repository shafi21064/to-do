import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {

  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController subTitleTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
              obscureText: false,
              controller: titleTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter title',
              )),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: false,
              controller: subTitleTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'enter subtitle',
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("save"),
            ),
          )
        ]),
      ),
    );
  }
}
