import 'package:flutter/material.dart';
import 'package:marvel/components/Personagem-tile.dart';
import 'package:marvel/consultas.dart';
import 'package:marvel/models/personagem.dart';

class PersonagensList extends StatelessWidget {
  final personagens = {
    "1": Personagem(
      name: 'awbdauiwbdiuabw',
      description: 'awbdaiuwbdiauwbdiuabwudibawuidbawubd',
      id: 1,
    )
  };

  @override
  Widget build(BuildContext context) {
    Consultas().getAll();

    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Personagens'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, i) =>
                PersonagemTile(personagens.values.elementAt(i))));
  }
}
