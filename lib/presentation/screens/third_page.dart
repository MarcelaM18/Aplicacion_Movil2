import 'dart:io';

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

  List<Event> filterItems = events;

  void searchItem(String text) {
    setState(() {
      filterItems = events
          .where((i) => i.location.toLowerCase().contains(text.toLowerCase()))
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
                        color: Color.fromRGBO(246, 251, 244, 0.85),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: TextField(
                            onChanged: searchItem,
                            controller: _searchController,
                            decoration: const InputDecoration(
                              labelText: 'Buscar por ciudad',
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 290,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: 323,
                    maxHeight: 520 - MediaQuery.of(context).viewInsets.bottom,
                  ),
                  width: 323,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(246, 251, 244, 0.85),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: GestureDetector(
                    child: ListView.builder(
                      itemCount: filterItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(filterItems[index].name),
                              subtitle: Text(filterItems[index].date),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: Image.file(
                                    File(filterItems[index].photo),
                                    fit: BoxFit.cover,
                                    scale: 1,
                                  ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Text(filterItems[index].name),
                                      ),
                                      content: Container(
                                        height: 310,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 300,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.black,
                                              ),
                                              child: Image.file(
                                                  File(filterItems[index].photo),
                                                  fit: BoxFit.cover,
                                                  scale: 1,
                                                ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 140,
                                              decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                              text: 'Descripción: ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white, // Color para "Fecha"
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold, // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  filterItems[index].description,
                                                              style: const TextStyle(
                                                                color: Colors
                                                                    .black, // Color para la fecha
                                                                // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: 300,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                              text: 'Lugar: ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white, // Color para "Fecha"
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold, // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  filterItems[index].location,
                                                              style: const TextStyle(
                                                                color: Colors
                                                                    .black, // Color para la fecha
                                                                // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: 300,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                              text: 'Fecha: ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white, // Color para "Fecha"
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold, // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  filterItems[index].date,
                                                              style: const TextStyle(
                                                                color: Colors
                                                                    .black, // Color para la fecha
                                                                // Otras propiedades de estilo según sea necesario
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cerrar"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            Container(
                              width: 290,
                              height: 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
