import 'package:flutter/material.dart';
import 'package:notices_app/services/favoritos.dart';
import 'package:notices_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<Favoritos>(context).getArticulosCategoria;
    return Scaffold(
        body: (newsService.isNotEmpty)
            ? ListaNoticias(newsService, Axis.vertical)
            : Center(
                child:
                    Text('NO SE HA AGREGADO NINGUNA \n NOTICIA A FAVORITOS')));
  }
}
