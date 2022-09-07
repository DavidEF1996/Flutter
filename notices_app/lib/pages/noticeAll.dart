import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notices_app/models/apiNoticias.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:notices_app/theme/theme.dart';
import 'package:notices_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

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
            const Text(
              'Más noticias interesantes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ScrollLoopAutoScroll(
                delay: const Duration(seconds: 1),
                duration: const Duration(seconds: 60),
                delayAfterScrollInput: const Duration(seconds: 3),
                enableScrollInput: true,
                duplicateChild: 2,
                scrollDirection: Axis.horizontal,
                child: ListView.builder(
                  scrollDirection: scrollDirection,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int ind) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NoticiaCompleta(
                                        index: ind,
                                        noticia:
                                            newsProv.getArticulosCategoria[ind],
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
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  children: [
                                    Text(
                                      "${newsProv.getArticulosCategoria[ind].title.substring(0, 55)}...",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                10,
                                        child: (newsProv
                                                    .getArticulosCategoria[ind]
                                                    // ignore: unnecessary_null_comparison
                                                    .urlToImage !=
                                                null)
                                            ? FadeInImage(
                                                image: NetworkImage(newsProv
                                                    .getArticulosCategoria[ind]
                                                    .urlToImage),
                                                placeholder: const AssetImage(
                                                    'assets/img/giphy.gif'),
                                                imageErrorBuilder: (context,
                                                    error, stackTrace) {
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
                        ),
                      ),
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
