import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notices_app/models/categorias.dart';

import '../models/apiNoticias.dart';

class Favoritos with ChangeNotifier {
  List<CategoriasNews> listaCategorias = [
    const CategoriasNews(FontAwesomeIcons.building, 'business'),
    const CategoriasNews(FontAwesomeIcons.tv, 'entertainment'),
    const CategoriasNews(FontAwesomeIcons.addressCard, 'general'),
    const CategoriasNews(FontAwesomeIcons.virus, 'health'),
    const CategoriasNews(FontAwesomeIcons.football, 'sports'),
    const CategoriasNews(FontAwesomeIcons.vial, 'science'),
    const CategoriasNews(FontAwesomeIcons.laptop, 'technology'),
  ];

  Map<String, List<Article>> articulosFavoritos = {};
  int index = 0;

  Favoritos() {
    articulosFavoritos['favoritos'] = [];
  }

  List<Article> get getArticulosCategoria {
    return articulosFavoritos['favoritos']!;
  }

  guardarNoticias(Article article) {
    int cont = 0;
    if (articulosFavoritos['favoritos']!.isEmpty) {
      articulosFavoritos['favoritos']!.add(article);
      index++;
      notifyListeners();
    } else {
      for (var i = 0; i < articulosFavoritos['favoritos']!.length; i++) {
        if (articulosFavoritos['favoritos']![i].title == article.title) {
          cont++;
        }

        if (cont == 0) {
          articulosFavoritos['favoritos']!.add(article);
          index++;
          notifyListeners();
        }
      }
    }

    print(articulosFavoritos);
  }
}
