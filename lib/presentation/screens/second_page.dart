import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/event_registration.dart';
import 'package:navegacion/presentation/screens/third_page.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';
import 'package:navegacion/presentation/widgets/menu_drawer.dart';

import '../../datos/events_list.dart';
import '../../dominio/models/event.dart';

class HomeEventos extends StatefulWidget {
   
  const HomeEventos({Key? key});

  @override
  _HomeEventosState createState() => _HomeEventosState();
}

class _HomeEventosState extends State<HomeEventos> {
  final TextEditingController _searchController = TextEditingController();
  List<Event> filterItems = events;

  void searchItems(String text) {
    setState(() {
      filterItems = events
          .where((e) => e.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppbar(),
      drawer: const  NavegationDrawer(),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: 
      Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/img/fondohome2.png',
              fit: BoxFit.cover,
              // color: Color.fromARGB(66, 128, 125, 125),
              // colorBlendMode: BlendMode.modulate,
            ),
          ),
          Column(
            children: [
            const  SizedBox(height: 13),
              Row(
                children: [
                  Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 27,
                        // height: 17,
                        child: IconButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, icon: const  Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(137, 17, 17, 17),
                          size: 25,
                        ),)
                      ),
                    ],
                  ),
                const  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 274,
                        height: 44,
                        child: Text(
                          'Eventos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(230, 255, 255, 255),
                            fontSize: 32,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.w400,
                            height: 0.62,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
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
                                      builder: (context) => const EventoRegistro(),
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
                            const Text('Registar')
                          ],
                        ),
                        const SizedBox(width:30),
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
                                      builder: (context) => const ThirdPage(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.map,
                                  size: 50,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                            const Text('Ubicaciones')
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
                //buscar
              Container(
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                    width: 317,
                    height: 52,
                      margin: const EdgeInsets.fromLTRB(18, 20, 18, 0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(207, 248, 248, 248),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: TextField(
                            onChanged: searchItems,
                            controller: _searchController,
                            decoration: const InputDecoration(
                              labelText: 'Buscar Evento',
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
                        color: Color.fromARGB(207, 247, 237, 237),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: 317,
                    maxHeight: 323 ,
                  ),
                  width: 317,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(207, 247, 237, 237),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: GestureDetector(
                    child: ListView.builder(
                      itemCount:  filterItems.length,
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
                                // child: Image.file(
                                //     File(filterItems[index].photo),
                                //     fit: BoxFit.cover,
                                //     scale: 1,
                                //   ),
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 300,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.black,
                                                
                                              ),
                                              // child: Image.file(
                                              //     File(filterItems[index].photo),
                                              //     fit: BoxFit.cover,
                                              //     scale: 1,
                                              //   ),
                                            ),
                                            const SizedBox(height: 20,),
                                            Container(
                                              height: 140,
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        'Descripción: ${filterItems[index].description}')
                                                    ),
                                                    const SizedBox(height: 20,),
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        'Lugar: ${filterItems[index].location}')
                                                    ),
                                                    const SizedBox(height: 20,),
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        'Lugar: ${filterItems[index].date}')
                                                    ),

                                                    
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Cerrar"),
                                            ),
                                            ElevatedButton(onPressed:
                                             (){
                                           setState((){
                                           filterItems.removeAt(index);
                                            });
                                             },
                                             child: Icon(Icons.delete),),
                                          ],
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
        ]),         
            ],
          ),
      ),
       );
      
                                   
          
                  
    



  }
}
