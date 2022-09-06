import 'package:flutter/material.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:notices_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tabs1Page extends StatefulWidget {
  const Tabs1Page({Key? key}) : super(key: key);

  @override
  State<Tabs1Page> createState() => _Tabs1PageState();
}

class _Tabs1PageState extends State<Tabs1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context).headlines;
    Axis scrollDirection = Axis.vertical;
    return Scaffold(
        body: (newsService.isNotEmpty)
            ? ListaNoticias(newsService, scrollDirection)
            : const Center(child: CircularProgressIndicator()));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
