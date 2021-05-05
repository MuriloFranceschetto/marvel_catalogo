import 'package:flutter/material.dart';
import 'package:marvel/models/personagem.dart';

class PersonagemTile extends StatelessWidget {
  final Personagem personagem;

  const PersonagemTile(this.personagem);

  @override
  Widget build(BuildContext context) {
    final subtitle = personagem.description.length > 30
        ? personagem.description.substring(0, 30) + '...'
        : personagem.description;

    // final avatar = personagem.imagem == null || personagem.imagem.isEmpty
    //     ? CircleAvatar(child: Icon(Icons.person))
    //     : CircleAvatar(child: Icon(Icons.person));

    final avatar = CircleAvatar(child: Icon(Icons.person));

    return ListTile(
      leading: avatar,
      title: Text(
        personagem.name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () => {},
    );
  }
}
