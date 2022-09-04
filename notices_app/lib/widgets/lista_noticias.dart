import 'package:flutter/material.dart';
import 'package:notices_app/models/apiNoticias.dart';
import 'package:notices_app/theme/theme.dart';

// ignore: must_be_immutable
class ListaNoticias extends StatelessWidget {
  List<Article> noticias;

  ListaNoticias(this.noticias, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext contex, int index) {
        return Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class Noticia extends StatefulWidget {
  Article noticia;
  int index;

  Noticia({Key? key, required this.noticia, required this.index})
      : super(key: key);

  @override
  State<Noticia> createState() => _NoticiaState();
}

class _NoticiaState extends State<Noticia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Text(
              '${widget.index + 1}. ',
              style: TextStyle(color: myTheme.colorScheme.secondary),
            ),
            Text('${widget.noticia.source.name}. ')
          ]),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.noticia.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: const Radius.circular(50)),
            child: Container(
                child: (widget.noticia.urlToImage != null)
                    ? FadeInImage(
                        image: NetworkImage(widget.noticia.urlToImage),
                        placeholder: const AssetImage('assets/img/giphy.gif'),
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
          child: Text(widget.noticia.description ?? ''),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
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
        )
      ],
    );
  }
}
