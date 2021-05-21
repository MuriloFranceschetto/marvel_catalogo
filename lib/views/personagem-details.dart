import 'package:flutter/material.dart';
import 'package:marvel/components/Title.dart';
import 'package:marvel/models/response-marvel.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonagemDetails extends StatelessWidget {
  final Results personagem;
  const PersonagemDetails(this.personagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.personagem.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Text(this.personagem.description,
                style: TextStyle(color: Colors.white)),
          ),
          Card(child: _buildComics(), color: Colors.black12),
          Card(child: _buildEvents(), color: Colors.black12),
          Card(child: _buildStories(), color: Colors.black12),
          Card(child: _buildSeries(), color: Colors.black12),
          Card(child: _buildOthers(), color: Colors.black12)
        ],
      ),
    );
  }

  _buildComics() {
    if (this.personagem.comics.returned > 0) {
      return new Column(
        children: <Widget>[
          MyTitle('Quadrinhos'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personagem.comics.returned,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(personagem.comics.items[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              );
            },
          ),
        ],
      );
    } else {
      return;
    }
  }

  _buildEvents() {
    if (this.personagem.events.returned > 0) {
      return new Column(
        children: <Widget>[
          MyTitle('Eventos que Marcaram'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personagem.events.returned,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(personagem.events.items[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              );
            },
          )
        ],
      );
    } else {
      return;
    }
  }

  _buildStories() {
    if (this.personagem.stories.returned > 0) {
      return new Column(
        children: <Widget>[
          MyTitle('Histórias'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personagem.stories.returned,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(personagem.stories.items[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              );
            },
          )
        ],
      );
    } else {
      return;
    }
  }

  _buildSeries() {
    if (this.personagem.series.returned > 0) {
      return new Column(
        children: <Widget>[
          MyTitle('Séries'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personagem.series.returned,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(personagem.series.items[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              );
            },
          )
        ],
      );
    } else {
      return;
    }
  }

  _buildOthers() {
    if (this.personagem.series.returned > 0) {
      return new Column(
        children: <Widget>[
          MyTitle('Mais informações em:'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personagem.urls.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  _launchURL(personagem.urls[index].url);
                },
                title: Text(
                  personagem.urls[index].type,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  personagem.urls[index].url,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          )
        ],
      );
    } else {
      return;
    }
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
