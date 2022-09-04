import 'package:flutter/cupertino.dart';
import 'package:notices_app/models/apiNoticias.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '7a9eb10862f14aa1ba78fcf9d60946fa';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];

  NewsServices() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    dynamic url = '$_URL_NEWS/top-headlines?country=ar&apiKey=$_API_KEY';
    final response = await http
        .get(Uri.parse('$_URL_NEWS/top-headlines?country=ar&apiKey=$_API_KEY'));
    final newsResponse = newsResponseFromJson(response.body);
    List<Article> lista = newsResponse.articles;
    headlines.addAll(lista);
    print("finalizo");
    notifyListeners();
  }
}
