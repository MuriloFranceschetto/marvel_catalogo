import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:marvel/models/response-marvel.dart';

class HttpService {
  final String url = "https://gateway.marvel.com/v1/public/";
  final String apikey = "2fb461a669954c29884728213b091e3b";
  final String privateKey = "b68c9eabffc16e519622e7bdf2c33205a6635781";

  Future<List<Results>> getAll(String nome) async {
    int ts = DateTime.now().millisecondsSinceEpoch;
    String hash = md5
        .convert(utf8.encode('$ts${this.privateKey}${this.apikey}'))
        .toString();

    String filterName = '';
    if (nome != null && nome != '') {
      filterName = 'nameStartsWith=$nome';
    }

    final url = Uri.parse(
        '${this.url}characters?$filterName&ts=$ts&apikey=$apikey&hash=$hash');

    print(url);

    var response = await http.get(url);
    var responseParsed = parseResponse(response.body);
    return responseParsed.data.results.map<Results>((pers) => pers).toList();
  }

  Future<Results> getById(int codigo) async {
    int ts = DateTime.now().millisecondsSinceEpoch;
    String hash = md5
        .convert(utf8.encode('$ts${this.privateKey}${this.apikey}'))
        .toString();

    final url = Uri.parse(
        '${this.url}characters/$codigo?ts=$ts&apikey=$apikey&hash=$hash');

    var response = await http.get(url);
    var responseParsed = parseResponse(response.body);
    return responseParsed.data.results[0];
  }

  Future<Results> getImage(String url) async {
    var response = await http.get(Uri.parse(url));
    var responseParsed = parseResponse(response.body);
    return responseParsed.data.results[0];
  }

  ResponseMarvel parseResponse(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return ResponseMarvel.fromJson(parsed);
  }
}
