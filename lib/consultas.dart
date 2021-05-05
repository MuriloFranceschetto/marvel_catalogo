import 'dart:convert';
import 'package:marvel/models/personagem.dart';
import 'package:http/http.dart' as http;

class Consultas {
  Future<Personagem> getAll() async {
    try {
      var url =
          'https://gateway.marvel.com/v1/public/characters?ts=1620176863255&apikey=2fb461a669954c29884728213b091e3b&hash=b691f03eee2a4547ed0d3b7943f6ab0e';
      var response = await http.get(Uri(host: url));
      print(response);
      return jsonDecode(response.body).data.results;
      // return (jsonDecode(response.body).data.results as List)
      //     .map((e) => Personagem.fromJson(e))
      //     .toList();
    } catch (e) {
      throw (e.message);
    }
  }
}
