import 'package:flutter/material.dart';

class MenuAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text(
          'Green Planet',
          style: TextStyle(
            fontSize: 20, color:Colors.white, fontFamily: 'Pacifico'
            ),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed:( ){} , icon: Icon(Icons.person),)
        ]);

  }

  @override
  Size get preferredSize => const Size(0, kToolbarHeight);
}
