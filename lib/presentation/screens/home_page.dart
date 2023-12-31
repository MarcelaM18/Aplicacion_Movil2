import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/second_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

import '../../dominio/models/imagen_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavegationDrawer(),
      appBar: const MenuAppbar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeEventos(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.event_available,
                          size: 50,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    const Text('Eventos')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          const Text(
            'Productos Destacados',
            style: TextStyle(
              color: Color.fromARGB(255, 178, 174, 62),
              fontSize: 18,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4, // Ajusta la altura como desees
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/fondo2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.all(50.0),
                    child: const Text(
                      'Esta aplicación busca contribuir a la consecución de los Objetivos de Desarrollo Sostenible (ODS) establecidos por las Naciones Unidas, abordando desafíos como la pobreza, el cambio climático y la igualdad.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
