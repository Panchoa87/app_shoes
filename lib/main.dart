import 'package:app_shoes/src/pages/zapatos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ZapatosPage(),
      // home: ZapatoDescPage()
    );
  }
}
