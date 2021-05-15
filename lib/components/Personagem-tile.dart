import 'package:flutter/material.dart';
import 'package:marvel/models/response-marvel.dart';
import 'package:marvel/views/personagem-details.dart';

class PersonagemTile extends StatelessWidget {
  final Results personagem;

  const PersonagemTile(this.personagem);

  @override
  Widget build(BuildContext context) {
    final subtitle = personagem.description.length > 35
        ? personagem.description.substring(0, 35) + '...'
        : personagem.description;

    final avatar = CircleAvatar(
      backgroundImage: NetworkImage(
          '${this.personagem.thumbnail.path}/portrait_medium.${this.personagem.thumbnail.extension}'),
    );

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
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PersonagemDetails(this.personagem))),
      },
    );
  }
}
