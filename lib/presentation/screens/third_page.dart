import 'package:flutter/material.dart';
import 'package:navegacion/datos/events_list.dart';
import 'package:navegacion/dominio/models/event.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Event> filterItems = [
    Event(
      name: "Evento 1",
      description: "Descripción del evento 1",
      location: "Ubicación del evento 1",
      photo: "imagen1.jpg",
    ),
    Event(
      name: "Evento 2",
      description: "Descripción del evento 2",
      location: "Ubicación del evento 2",
      photo: "imagen2.jpg",
    ),
    Event(
      name: "Evento 3",
      description: "Descripción del evento 3",
      location: "Ubicación del evento 3",
      photo: "imagen3.jpg",
    ),
  ];

  void searchItem(String text) {
    setState(() {
      filterItems = events
          .where((i) => i.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppbar(),
      drawer: const NavegationDrawer(),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: searchItem,
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  labelText: 'Buscar por ciudad',
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 290,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Column(),
                    ),
                  ],
                ),
              ),
              Container(
                width: 323,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: ListView.builder(
                  itemCount: filterItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(filterItems[index].name),
                      subtitle: Text(filterItems[index].location),
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
