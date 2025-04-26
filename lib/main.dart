import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/adicionar.dart';
import 'telas/sobre.dart';
void main() {
  runApp(AppListaCompras());
}

class AppListaCompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras 🛍️',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Color(0xFFF0F0F0),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaHome(),
        '/adicionar': (context) => TelaAdicionar(),
        '/sobre': (context) => TelaSobre(),
      },
    );
  }
}
