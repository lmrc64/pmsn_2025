import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          contador++;
          setState(() {});
          print(contador);
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffffc2d1),
              title: Center(
                child: const Text(
                  'Hola Mundo :)',
                  style: TextStyle(
                      fontFamily: 'CyberBrush',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Image.network(
                    'https://c0.klipartz.com/pngpicture/450/102/gratis-png-instituto-tecnologico-de-celaya-logo-estudiante-tecnologia-avenida-tecnologico-estudiante-thumbnail.png'),
                onPressed: () {
                  contador++;
                  setState(() {});
                  print(contador);
                }),
            body: Center(
                child: Text(
              'Valor del contador $contador',
              style: TextStyle(fontSize: 20, fontFamily: 'CyberBrush'),
            ))),
      ),
    );
  }
}
