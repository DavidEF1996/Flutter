import 'package:flutter/material.dart';
import 'package:notices_app/pages/tabs_page.dart';
import 'package:notices_app/services/favoritos.dart';
import 'package:notices_app/services/news_service.dart';
import 'package:notices_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favoritos(),
        )
      ],
      child: MaterialApp(
        title: 'Notices App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const TabsPage(),
      ),
    );
  }
}
