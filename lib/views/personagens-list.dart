import 'package:flutter/material.dart';
import 'package:marvel/components/Personagem-tile.dart';
import 'package:marvel/models/response-marvel.dart';
import 'package:marvel/services/HttpService.dart';

class MyHomePage extends StatefulWidget {
  @override
  PersonagensList createState() => PersonagensList();
}

class PersonagensList extends State<MyHomePage> {
  final HttpService http = HttpService();

  List<Results> personagens;
  bool searching = false;
  TextEditingController searchForm = TextEditingController();

  buscaPersonagens() async {
    await http.getAll(searchForm.value.text).then((value) => {
          setState(() async {
            this.personagens = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !searching
            ? Text('Lista de Personagens')
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Procure aqui por um personagem',
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                controller: searchForm,
                onSubmitted: (value) {
                  setState(() {
                    buscaPersonagens();
                  });
                },
              ),
        actions: <Widget>[
          !searching
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.searching = !this.searching;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      searchForm.value = TextEditingValue(text: '');
                      this.searching = false;
                    });
                  },
                ),
        ],
      ),
      body: ListView(
        children: this
            .personagens
            .map((Results result) => PersonagemTile(result))
            .toList(),
      ),
    );
  }
}
