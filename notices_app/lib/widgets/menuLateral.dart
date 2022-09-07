import 'package:flutter/material.dart';
import 'package:notices_app/pages/favoritos_page.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black45,
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Container(
                    alignment: Alignment.bottomCenter,
                    //child: Cabecera(),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  accountEmail: null,
                ),
              ),
              Ink(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoritosPage()),
                          );
                        },
                        child: Text(
                          'FAVORITOS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
