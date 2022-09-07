import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notices_app/models/apiNoticias.dart';
import 'package:http/http.dart' as http;
import 'package:notices_app/models/categorias.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '7a9eb10862f14aa1ba78fcf9d60946fa';

class NewsServices with ChangeNotifier {
  List<Article> headlines = [];

  String categoriaSeleccionada = 'business';

  List<CategoriasNews> listaCategorias = [
    const CategoriasNews(FontAwesomeIcons.building, 'business'),
    const CategoriasNews(FontAwesomeIcons.tv, 'entertainment'),
    const CategoriasNews(FontAwesomeIcons.addressCard, 'general'),
    const CategoriasNews(FontAwesomeIcons.virus, 'health'),
    const CategoriasNews(FontAwesomeIcons.football, 'sports'),
    const CategoriasNews(FontAwesomeIcons.vial, 'science'),
    const CategoriasNews(FontAwesomeIcons.laptop, 'technology'),
  ];

  Map<String, List<Article>> articulosporcategoria = {};

  NewsServices() {
    getTopHeadlines();

//recorro las categorias y creo un elemento de lista vacìa para agregar dichos elementos
    listaCategorias.forEach((element) {
      articulosporcategoria[element.name] = [];
    });
    getArticleByName(categoriaSeleccionada);
  }

  List<Article> get getArticulosCategoria {
    return articulosporcategoria[getCatSelect]!;
  }

  get getCatSelect => categoriaSeleccionada;

  set setCatSelect(String valor) {
    categoriaSeleccionada = valor;
    getArticleByName(valor);
    notifyListeners();
  }

  get getListaCategorias => listaCategorias;

  getTopHeadlines() async {
    dynamic url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY';
    final response = await http
        .get(Uri.parse('$_URL_NEWS/top-headlines?country=ar&apiKey=$_API_KEY'));
    final newsResponse = newsResponseFromJson(response.body);
    List<Article> lista = newsResponse.articles;
    headlines.addAll(lista);
    print("finalizo");
    notifyListeners();
  }

  getArticleByName(String valor) async {
    if (articulosporcategoria[valor]!.isNotEmpty) {
      return articulosporcategoria[valor];
    }
    dynamic url =
        '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY&category=$valor';
    print(url);
    final response = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(response.body);
    articulosporcategoria[valor]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
