import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/second_page.dart';
import 'package:navegacion/presentation/screens/third_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

import '../../dominio/models/imagen_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegationDrawer(),
      appBar: const MenuAppbar(),
      body: Column(
        children: [
        const SizedBox(height: 30,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage() ,
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
              const SizedBox(
              height: 100,
            ),
            
              Column(
                children: [
                  Container(
                    
                    decoration: BoxDecoration(
                        color:  Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage() ,
                            ),
                          );
                      },
                      icon: const Icon(
                        Icons.accessibility,
                        size: 50,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const Text('Personas')
                ],
              ),
              const SizedBox(
              height: 100,
            ),
            ],
          ),
          const Text('Productos Destacados',
          style: TextStyle(
            color: Color.fromARGB(255, 178, 174, 62),fontSize: 18)),
          CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
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
          ],
          ),
        ],
      );
  }
}
