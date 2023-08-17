import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/second_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegationDrawer(),
      appBar: const MenuAppbar(),
      body: Column(
        children: [
          Container(
            height: 200,
            child: PageView(
              children: [
                Image.asset(
                  'assets/img/fondo1.jpg',
                  width: 400,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/img/fondo3.jpg',
                  width: 400,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/img/fondo4.jpg',
                  width: 400,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Expanded(
            child: CenterContent(),
          ),
        ],
      ),
    );
  }
}

class CenterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/fondo2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.black.withOpacity(0.6),
              padding: const EdgeInsets.all(50.0),
              child: const Text('Esta aplicación busca contribuir a la consecución de los Objetivos de Desarrollo Sostenible (ODS) establecidos por las Naciones Unidas, abordando desafíos como la pobreza, el cambio climático y la igualdad.', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: const Text('Ir a la segunda Pagina'),
            ),
          ],
        ),
      ],
    );
  }
}
