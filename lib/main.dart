import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const Home(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 59, 152, 62)
    )
    ,
    );
  }
}