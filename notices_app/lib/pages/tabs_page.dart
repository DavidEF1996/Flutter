import 'package:flutter/material.dart';
import 'package:notices_app/pages/tabs_page1.dart';
import 'package:notices_app/providers/providerNavegacion.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavegacionModel(),
      child: Scaffold(
        body: _pages(),
        bottomNavigationBar: _navigation(),
      ),
    );
  }
}

class _navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavegacionModel>(context);
    return BottomNavigationBar(
        //onTap: ,
        currentIndex: provider.paginaActual,
        onTap: (i) {
          provider.setPaginaActual = i;
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Para ti'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Encabezados')
        ]);
  }
}

class _pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavegacionModel>(context);
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: provider.pageControl,
      children: <Widget>[
        const Tabs1Page(),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}
