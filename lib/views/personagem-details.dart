import 'package:flutter/material.dart';
import 'package:marvel/models/response-marvel.dart';

class PersonagemDetails extends StatelessWidget {
  final Results personagem;
  const PersonagemDetails(this.personagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.personagem.name),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: Column(
          children: [
            Text(this.personagem.description,
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
