import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/home_page.dart';
import 'package:navegacion/presentation/screens/second_page.dart';
import 'package:navegacion/presentation/screens/third_page.dart';

class NavegationDrawer extends StatelessWidget {
  const NavegationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
    
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Green Planet',
                style: TextStyle(
                  fontSize: 45, color: Colors.white, fontFamily: 'Pacifico'
                ),
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Eventos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeEventos()),);
            },),
            ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personas'),
            onTap: () {
        
              Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}
