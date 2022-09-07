import 'package:flutter/material.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:notices_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class Tabs2Page extends StatelessWidget {
  const Tabs2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Axis scrollDirection = Axis.vertical;
    final newsProv = Provider.of<NewsServices>(context);
    return Scaffold(
      body: Column(children: [
        Container(
          height: 80,
          color: Colors.black38,
          child: BotonesSlider(newsProv: newsProv),
        ),
        Expanded(
            child: (newsProv.getArticulosCategoria.isNotEmpty)
                ? ListaNoticias(newsProv.getArticulosCategoria, scrollDirection)
                : const Center(child: CircularProgressIndicator()))
      ]),
    );
  }
}

class BotonesSlider extends StatelessWidget {
  const BotonesSlider({
    Key? key,
    required this.newsProv,
  }) : super(key: key);

  final NewsServices newsProv;

  @override
  Widget build(BuildContext context) {
    final provColor = Provider.of<NewsServices>(context);
    return ScrollLoopAutoScroll(
      delay: const Duration(seconds: 1),
      duration: const Duration(seconds: 20),
      delayAfterScrollInput: const Duration(seconds: 20),
      enableScrollInput: true,
      duplicateChild: 2,
      scrollDirection: Axis.horizontal,

      //controller: controller.animateTo(offset, duration: duration, curve: curve),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: newsProv.listaCategorias.length,
          itemBuilder: (context, index) {
            print("La categoria es: " + newsProv.listaCategorias[index].name);
            final nameCategori = newsProv.listaCategorias[index].name;
            return GestureDetector(
              onTap: () {
                final newsProv =
                    Provider.of<NewsServices>(context, listen: false);
                newsProv.setCatSelect = nameCategori;
              },
              child: Padding(
                padding: index == 6
                    ? const EdgeInsets.only(
                        top: 10, bottom: 10, right: 0, left: 10)
                    : const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                          color: newsProv.listaCategorias[index].name ==
                                  provColor.getCatSelect
                              ? Colors.red
                              : Colors.black,
                          newsProv.listaCategorias[index].icondata),
                    ),
                    Text(
                        '${nameCategori[0].toUpperCase()}${nameCategori.substring(1)}')
                  ],
                ),
              ),
            );
          }),
    );
  }
}
