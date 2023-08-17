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
  final List<Map<String, dynamic>> itemList = [
    {
      'title': 'Item 1',
      'image': 'assets/img/item1_image.png',
      'sublist': ['Subitem 1.1', 'Subitem 1.2', 'Subitem 1.3'],
    },
    {
      'title': 'Item 2',
      'image': 'assets/item2_image.png',
      'sublist': ['Subitem 2.1', 'Subitem 2.2'],
    },
    {
      'title': 'Item 3',
      'image': 'assets/item3_image.png',
      'sublist': ['Subitem 3.1', 'Subitem 3.2', 'Subitem 3.3', 'Subitem 3.4'],
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
                  height: 20,
                ),
                Container(
                  width: 325,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Eventos cerca de usted',
                        style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                        ),
                      ),
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 325,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: selectedCity != null
                      ? ListView.builder(
                          itemCount: itemList.length,
                          itemBuilder: (context, index) {
                            final item = itemList[index];
                            return ListTile(
                              title: Text(
                                item['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                item['sublist'].join(', '),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
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
                const SizedBox(height: 30),
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
                    const SizedBox(
                      width: 20,
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
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}
