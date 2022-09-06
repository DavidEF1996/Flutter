import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notices_app/models/apiNoticias.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:notices_app/theme/theme.dart';
import 'package:notices_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class NoticiaCompleta extends StatelessWidget {
  Article noticia;
  int index;

  NoticiaCompleta({super.key, required this.index, required this.noticia});

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsServices>(context);
    Axis scrollDirection = Axis.horizontal;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(noticia.source.name),
                    Text(noticia.publishedAt.toString().substring(0, 10))
                  ]),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  noticia.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: const Radius.circular(50)),
                child: Container(
                    child: (noticia.urlToImage != null)
                        ? FadeInImage(
                            image: NetworkImage(noticia.urlToImage),
                            placeholder:
                                const AssetImage('assets/img/giphy.gif'),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/img/no-image.png',
                                  fit: BoxFit.fitWidth);
                            },
                            fit: BoxFit.fitWidth,
                          )
                        : const Image(
                            image: AssetImage('assets/img/no-image.png'),
                          )),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(noticia.content ?? ''),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                noticia.author ?? '',
                textAlign: TextAlign.right,
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  fillColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  child: const Icon(Icons.star_border),
                ),
                const SizedBox(
                  width: 10,
                ),
                RawMaterialButton(
                    fillColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: const Icon(Icons.more))
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Más noticias interesantes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoticiaCompleta(
                              index: index,
                              noticia: newsProv.getArticulosCategoria[index],
                            )));
              },
              child: Container(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: scrollDirection,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Text(
                                  newsProv.getArticulosCategoria[index].title
                                          .substring(0, 55) +
                                      "...",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    child: (newsProv
                                                .getArticulosCategoria[index]
                                                .urlToImage !=
                                            null)
                                        ? FadeInImage(
                                            image: NetworkImage(newsProv
                                                .getArticulosCategoria[index]
                                                .urlToImage),
                                            placeholder: const AssetImage(
                                                'assets/img/giphy.gif'),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/img/no-image.png',
                                                  fit: BoxFit.fitWidth);
                                            },
                                            fit: BoxFit.fitWidth,
                                          )
                                        : const Image(
                                            image: AssetImage(
                                                'assets/img/no-image.png'),
                                          )),
                              ],
                            ))
                      ],
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
