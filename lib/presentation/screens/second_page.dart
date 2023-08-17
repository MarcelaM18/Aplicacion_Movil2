import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/home_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';
import 'package:navegacion/presentation/screens/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});


    @override
  Widget build(BuildContext context) {

  List eventos = [
    {"nombre" : "EcoFest: Celebrando la Sostenibilidad Ambiental", "lugar" : "Medellin", "estado" : "Activo"},
    {"nombre" : "Conferencia Verde: Camino hacia un Futuro Sostenible", "lugar" : "Bogota", "estado" : "Inactivo"},
    {"nombre" : "Semana de Acción Ambiental: Construyendo Juntos un Mundo Verde", "lugar" : "Medellin", "estado" : "Activo"},
    {"nombre" : "Cumbre EcoConsciente: Innovación y Sostenibilidad Ambiental", "lugar" : "Medellin", "estado" : "Activo"},
    {"nombre" : "Foro EcoVisión 2023: Diseñando un Futuro Sostenible", "lugar" : "Cartagena", "estado" : "Activo"},
    {"nombre" : "Expo Sostenibilidad: Soluciones Innovadoras para un Planeta Saludable", "lugar" : "Medellin", "estado" : "Inactivo"},
    {"nombre" : "Ciclo de Charlas EcoImpacto: Conciencia y Cambio Ambiental", "lugar" : "Medellin", "estado" : "Activo"},
    {"nombre" : "Encuentro Verde Global: Uniendo Esfuerzos por un Mundo Sostenible", "lugar": "Bogota", "estado" : "Activo"},
    {"nombre" : "Seminario EcoProgreso: Avanzando hacia la Sostenibilidad Ambiental", "lugar" : "Medellin", "estado" : "Inactivo"},
    {"nombre" : "Jornadas EcoResponsables: Acciones Locales para Impacto Global", "lugar" : "Cartagena", "estado" : "Activo"},
    {"nombre" : "Feria EcoTecnología: Tecnologías Limpias para un Mañana Mejor", "lugar" : "Cartagena", "estado" : "Activo"},
    {"nombre" : "Festival EcoArte: Celebrando la Naturaleza a través de la Creatividad", "lugar" : "Bogota", "estado" : "Activo"}



  ];
    return  Scaffold(
      appBar: MenuAppbar(),
      drawer: NavegationDrawer(),
      backgroundColor: Colors.green[100],
     
      body: 
      
      ListView.builder(
  itemCount: eventos.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (index == 0)
          const  Padding(
              
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Eventos',
                style: TextStyle(fontSize: 24,),
              ),
            ),
          Row(
            children: [
              Icon(Icons.event, color: Colors.green, size: 24),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventos[index]['nombre'],
                      style: TextStyle(fontSize: 16,),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Lugar: ${eventos[index]['lugar']}',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Estado: ${eventos[index]['estado']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: eventos[index]['estado'] == 'Activo'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
)



    );
  }
}