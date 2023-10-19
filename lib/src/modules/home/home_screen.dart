import 'package:flutter/material.dart';
import 'package:localdatabase/src/model/note_model.dart';
import 'package:localdatabase/src/modules/home/add_task_screen.dart';
import 'package:localdatabase/src/modules/home/edit_task_screen.dart';
import 'package:localdatabase/src/utils/database_helper.dart';
import '../../data/global_widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> data = [];
  DBHelper db = DBHelper();

  @override
  void initState() {
    db = DBHelper();
    getData();
    print(data.length.toString());
    super.initState();
  }

  void getData() async {
    data = await db.getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const AppBarView(),
        body: FutureBuilder(
          future: db.getCartData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('No Data here'));
            } else {
              return ListView.builder(
                  itemCount: data.length,
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
                             db.delete(index);
                            },
                            child: ListTile(
                              title: Text(data[index].title.toString()),
                              subtitle: Text(data[index].subtitle.toString()),
                              leading: Icon(Icons.account_box),
                              trailing: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditTaskScreen()));
                                  },
                                  child: Icon(Icons.edit)),
                            ),
                          ),
                        ));
                  });
            }
          },
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
