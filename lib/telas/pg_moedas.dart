import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/acoes.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';
import 'package:prova_pratica_versao_final/modelos/bitcoins.dart';
import 'package:prova_pratica_versao_final/modelos/item.dart';
import 'package:prova_pratica_versao_final/modelos/moedas.dart';

class PgMoedas extends StatefulWidget {
  const PgMoedas({super.key});

  @override
  State<PgMoedas> createState() => _PgMoedasState();
}

class _PgMoedasState extends State<PgMoedas> {

  ApiValor financas = ApiValor.iniciar();

  Item? dolar;
  Item? euro;
  Item? peso;
  Item? yen;

  Item? blockchainInfo;
  Item? bitStamp;
  Item? mercadoBitcoin;
  Item? coinBase;
  Item? foxBit;

  Item? ibovespa;
  Item? ifix;
  Item? nasdaq;
  Item? dowjones;
  Item? cac;
  Item? nikkei;

  Moedas? moedas;
  Acoes? acoes;
  Bitcoins? bitcoins;

  _buscarMoedas() async {
    const String urlHgFinancas =
        "https://api.hgbrasil.com/finance?format=json-cors&key=4c448202";
    Response resposta = await get(Uri.parse(urlHgFinancas));
    Map cotacao = json.decode(resposta.body);

    dolar = Item("Dólar", cotacao["results"]["currencies"]["USD"]["buy"],
        cotacao["results"]["currencies"]["USD"]["variation"]);
    euro = Item("Euro", cotacao["results"]["currencies"]["EUR"]["buy"],
        cotacao["results"]["currencies"]["EUR"]["variation"]);
    peso = Item("Peso", cotacao["results"]["currencies"]["ARS"]["buy"],
        cotacao["results"]["currencies"]["ARS"]["variation"]);
    yen = Item("Yen", cotacao["results"]["currencies"]["JPY"]["buy"],
        cotacao["results"]["currencies"]["JPY"]["variation"]);
    moedas = Moedas(dolar, euro, peso, yen);

    ibovespa = Item("Ibovespa", cotacao["results"]["stocks"]["IBOVESPA"]["points"],
        cotacao["results"]["stocks"]["IBOVESPA"]["variation"]);
    ifix = Item("Ifix", cotacao["results"]["stocks"]["IFIX"]["points"],
        cotacao["results"]["stocks"]["IFIX"]["variation"]);
    nasdaq = Item("Nasdaq", cotacao["results"]["stocks"]["NASDAQ"]["points"],
        cotacao["results"]["stocks"]["NASDAQ"]["variation"]);
    dowjones = Item("Dowjones", cotacao["results"]["stocks"]["DOWJONES"]["points"],
        cotacao["results"]["stocks"]["DOWJONES"]["variation"]);
    cac = Item("Cac", cotacao["results"]["stocks"]["CAC"]["points"],
        cotacao["results"]["stocks"]["CAC"]["variation"]);
    nikkei = Item("Nikkei", cotacao["results"]["stocks"]["NIKKEI"]["points"],
        cotacao["results"]["stocks"]["NIKKEI"]["variation"]);
    acoes = Acoes(ibovespa, nasdaq, cac, ifix, dowjones, nikkei);

    blockchainInfo = Item("Blockchain.info", cotacao["results"]["bitcoin"]["blockchain_info"]["last"],
        cotacao["results"]["bitcoin"]["blockchain_info"]["variation"]);
    bitStamp = Item("BitStamp", cotacao["results"]["bitcoin"]["bitstamp"]["last"],
        cotacao["results"]["bitcoin"]["bitstamp"]["variation"]);
    mercadoBitcoin = Item("Mercado Bitcoin", cotacao["results"]["bitcoin"]["mercadobitcoin"]["last"],
        cotacao["results"]["bitcoin"]["mercadobitcoin"]["variation"]);
    coinBase = Item("CoinBase", cotacao["results"]["bitcoin"]["coinbase"]["last"],
        cotacao["results"]["bitcoin"]["coinbase"]["variation"]);
    foxBit = Item("FoxBit", cotacao["results"]["bitcoin"]["foxbit"]["last"],
        cotacao["results"]["bitcoin"]["foxbit"]["variation"]);
    bitcoins= Bitcoins(blockchainInfo, bitStamp, mercadoBitcoin, coinBase, foxBit);

    setState(() {
      financas = ApiValor(moedas, acoes, bitcoins);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanças de Hoje"),
        backgroundColor: const Color.fromARGB(255, 10, 63, 11),
      ),
      body: _criaBody(),
    );
  }

  _irAcoes() {
    Navigator.pushNamed(context, "/pgAcoes", arguments: financas);
  }

  _criaBody() {
    _buscarMoedas();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Center(
            child: Text(
              "Moedas",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextoVariacao(
                            nome: "Dólar",
                            valor: financas.moedas!.dolar!.valor,
                            variacao: financas.moedas!.dolar!.variacao),
                        TextoVariacao(
                            nome: "Euro",
                            valor: financas.moedas!.euro!.valor,
                            variacao: financas.moedas!.euro!.variacao)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextoVariacao(
                            nome: "Peso",
                            valor: financas.moedas!.peso!.valor,
                            variacao: financas.moedas!.peso!.variacao),
                        TextoVariacao(
                            nome: "Yen",
                            valor: financas.moedas!.yen!.valor,
                            variacao: financas.moedas!.yen!.variacao)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Botao(
            texto: "ir para Ações",
            funcao: _irAcoes,
          )
        ],
      ),
    );
  }
}
