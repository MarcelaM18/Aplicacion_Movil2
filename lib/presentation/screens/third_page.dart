import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/home_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';
import 'package:navegacion/presentation/screens/second_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  
  final List<Map<String, dynamic>> itemListMedellin = [
    {
      'title': 'Medellín',
      'image': 'assets/img/item1_image.png',
      'sublist': [
        'Evento Medellín 1',
        'Evento Medellín 2',
        'Evento Medellín 3'
      ],
    },
  ];

  final List<Map<String, dynamic>> itemListBogota = [
    {
      'title': 'Bogotá',
      'image': 'assets/img/item2_image.png',
      'sublist': [
        'Evento Bogotá 1', 
        'Evento Bogotá 2', 
        'Evento Bogotá 3'
      ],
    },
  ];

  final List<Map<String, dynamic>> itemListCartagena = [
    {
      'title': 'Cartagena',
      'image': 'assets/img/item3_image.png',
      'sublist': [
        'Evento cartagena 1',
        'Evento cartagena 2',
        'Evento cartagena 3'
      ],
    },
  ];

  String? selectedCity;

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 325,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Eventos cerca',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 290,
                          margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text(
                                  'Medellín',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                value: 'Medellín',
                                groupValue: selectedCity,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value as String;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                  'Bogotá',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                value: 'Bogotá',
                                groupValue: selectedCity,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value as String;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text(
                                  'Cartagena',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                value: 'Cartagena',
                                groupValue: selectedCity,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value as String;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 325,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: selectedCity == 'Medellín'
                      ? Container(
                          width: 320,
                          margin: const EdgeInsets.fromLTRB(7, 10, 1, 0),
                          child: ListView.builder(
                            itemCount: itemListMedellin.length,
                            itemBuilder: (context, index) {
                              final item = itemListMedellin[index];
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      item['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 29,
                                      ),
                                    ),
                                  ),
                                ),
                                subtitle: Container(
                                  height: 170,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      item['sublist'].join('\n\n'),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : selectedCity == 'Bogotá'
                          ? Container(
                              width: 320,
                              margin: const EdgeInsets.fromLTRB(7, 10, 1, 0),
                              child: ListView.builder(
                                itemCount: itemListBogota.length,
                                itemBuilder: (context, index) {
                                  final item = itemListBogota[index];
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          item['title'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 29,
                                          ),
                                        ),
                                      ),
                                    ),
                                    subtitle: Container(
                                      height: 170,
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item['sublist'].join('\n\n'),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : selectedCity == 'Cartagena'
                              ? Container(
                                  width: 320,
                                  margin:
                                      const EdgeInsets.fromLTRB(7, 10, 1, 0),
                                  child: ListView.builder(
                                    itemCount: itemListCartagena.length,
                                    itemBuilder: (context, index) {
                                      final item = itemListCartagena[index];
                                      return ListTile(
                                        title: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green,
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              item['title'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 29,
                                              ),
                                            ),
                                          ),
                                        ),
                                        subtitle: Container(
                                          height: 170,
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 20, 0, 0),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              item['sublist'].join('\n\n'),
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    'Seleccione una ciudad',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage(),
                          ),
                        );
                      },
                      child: const Text('Second Page'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      child: const Text('Home Page'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
