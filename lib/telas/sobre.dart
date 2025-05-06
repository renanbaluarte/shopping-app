import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre o app')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
          HyperLink
            (
            textStyle: TextStyle(color: Colors.black, fontSize: 15),
            linkStyle: TextStyle(
                color: Colors.orange, fontWeight: FontWeight.w700, fontSize: 15),
            text:
            'Esse aplicativo foi desenvolvido por [Renan Ferreira](https://github.com/renanbaluarte/shopping-app)🦊 ',
            linkCallBack: (link) {
//the clicked link
            },
          )
        ),
      ),
    );
  }
}
