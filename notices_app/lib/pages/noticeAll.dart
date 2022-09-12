import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notices_app/models/apiNoticias.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:provider/provider.dart';

class NoticiaCompleta extends StatelessWidget {
  Article noticia;
  int index;

  NoticiaCompleta({super.key, required this.index, required this.noticia});

  @override
  Widget build(BuildContext context) {
    final newsProv = Provider.of<NewsServices>(context);
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
                    bottomRight: Radius.circular(50)),
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
            const Text(
              'Más noticias interesantes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(autoPlay: true),
                  items: list
                      .map((item) => Container(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              NoticiaCompleta(
                                                index: int.parse(item),
                                                noticia: newsProv
                                                        .getArticulosCategoria[
                                                    int.parse(item)],
                                              )),
                                      ModalRoute.withName('/'));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Text(
                                              "${newsProv.getArticulosCategoria[int.parse(item)].title.substring(0, 55)}...",
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 100,
                                                child: (newsProv
                                                            .getArticulosCategoria[
                                                                int.parse(item)]
                                                            // ignore: unnecessary_null_comparison
                                                            .urlToImage !=
                                                        null)
                                                    ? FadeInImage(
                                                        image: NetworkImage(newsProv
                                                            .getArticulosCategoria[
                                                                int.parse(item)]
                                                            .urlToImage),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/img/giphy.gif'),
                                                        imageErrorBuilder:
                                                            (context, error,
                                                                stackTrace) {
                                                          return Image.asset(
                                                              'assets/img/no-image.png',
                                                              fit:
                                                                  BoxFit.cover);
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
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )),
          ]),
        ),
      ),
    );
  }
}

List<String> list = ['1', '2', '3', '4', '5'];
List<Widget> imageSliders = list
    .map((item) => Container(
          child: Text('hola'),
        ))
    .toList();
