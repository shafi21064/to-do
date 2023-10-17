import 'package:flutter/material.dart';

class AppBarView extends StatefulWidget implements PreferredSizeWidget{
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Quick Task Book"),
    );
  }
}
