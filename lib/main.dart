import 'package:flutter/material.dart';
import 'package:prova_pratica_versao_final/telas/pg_acoes.dart';
import 'package:prova_pratica_versao_final/telas/pg_bitcoin.dart';
import 'package:prova_pratica_versao_final/telas/pg_moedas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/pgMoedas",
      routes: {
        "/pgMoedas": (context) => const PgMoedas(),
        "/pgAcoes": (context) => const PgAcoes(),
        "/pgBitcoin": (context) => const PgBitcoin()
      },
    );
  }
}
