import 'package:flutter/material.dart';
import 'package:localdatabase/src/modules/home/add_task_screen.dart';
import 'package:localdatabase/src/modules/home/edit_task_screen.dart';
import '../../data/global_widgets/appbar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const AppBarView(),
        body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                child: Card(
                  elevation: 3,
                  child: Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: ValueKey<int>(index),
                    onDismissed: (DismissDirection direction) {
                      print("delete");
                    },
                    child: ListTile(
                      title: Text("here is title"),
                      subtitle: Text("here is subtitle"),
                      leading: Icon(Icons.account_box),
                      trailing: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EditTaskScreen()));
                          },
                          child: Icon(Icons.edit)),
                    ),
                  ),
                )
            );
          },
        ),

        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()));
            // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
            // .push(context, MaterialPageRoute(builder: (_)=>AddTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
