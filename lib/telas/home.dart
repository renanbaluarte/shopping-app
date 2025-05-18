import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Importa o mapa de ícones
import 'package:app_lista/icones.dart';

class TelaHome extends StatefulWidget {
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<String> compras = [];

  @override
  void initState() {
    super.initState();
    carregarListaSalva();
  }

  Future<void> carregarListaSalva() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('lista_compras');
    if (jsonString != null) {
      final List<dynamic> lista = json.decode(jsonString);
      setState(() {
        compras = List<String>.from(lista);
      });
    }
  }

  Future<void> salvarLista() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(compras);
    await prefs.setString('lista_compras', jsonString);
  }

  void remover(int index) {
    setState(() {
      compras.removeAt(index);
    });
    salvarLista();
  }

  void adicionar(String item) {
    setState(() {
      compras.add(item);
    });
    salvarLista();
  }

  IconData buscarIcone(String nomeItem) {
    final nome = nomeItem.toLowerCase();
    for (var palavra in iconesPorPalavra.keys) {
      if (nome.contains(palavra)) {
        return iconesPorPalavra[palavra]!;
      }
    }
    return Icons.shopping_basket; // ícone padrão
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Compras (${compras.length}) 🛒'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/sobre'),
          )
        ],
      ),
      body: compras.isEmpty
          ? Center(
        child: Text(
          'Nenhum item na lista ainda....',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: compras.length,
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(compras[index]),
              leading: Icon(buscarIcone(compras[index])),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => remover(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novo = await Navigator.pushNamed(context, '/adicionar');
          if (novo != null && novo is String) {
            adicionar(novo);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
