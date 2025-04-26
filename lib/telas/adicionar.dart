import 'package:flutter/material.dart';

class TelaAdicionar extends StatefulWidget {
  @override
  State<TelaAdicionar> createState() => _TelaAdicionarState();
}

class _TelaAdicionarState extends State<TelaAdicionar> {
  final _controller = TextEditingController();

  void salvar() {
    final texto = _controller.text.trim();
    if (texto.isNotEmpty) {
      Navigator.pop(context, texto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo item')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Adicione algo à sua lista',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ex: Tomate, Leite...',
              ),
              onSubmitted: (_) => salvar(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvar,
              child: Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
