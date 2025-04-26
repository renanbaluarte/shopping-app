import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<String> compras = [];

  void remover(int index) {
    setState(() {
      compras.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Compras 🛒'),
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
              leading: Icon(Icons.shopping_bag_outlined),
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
            setState(() {
              compras.add(novo);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
