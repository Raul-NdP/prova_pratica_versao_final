import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';

class PgMoedas extends StatefulWidget {
  const PgMoedas({super.key});

  @override
  State<PgMoedas> createState() => _PgMoedasState();
}

class _PgMoedasState extends State<PgMoedas> {
  dynamic _valorDolar = "";
  dynamic _valorEuro = "";
  dynamic _valorPeso = "";
  dynamic _valorYen = "";
  dynamic _variacaoDolar = "";
  dynamic _variacaoEuro = "";
  dynamic _variacaoPeso = "";
  dynamic _variacaoYen = "";

  dynamic _ibovespa = "";
  dynamic _variacaoIbovespa = "";
  dynamic _nasdaq = "";
  dynamic _variacaoNasdaq = "";
  dynamic _cac = "";
  dynamic _variacaoCac = "";
  dynamic _ifix = "";
  dynamic _variacaoIfix = "";
  dynamic _dowjones = "";
  dynamic _variacaoDowjones = "";
  dynamic _nikkei = "";
  dynamic _variacaoNikkei = "";

  dynamic _blockchainInfo = "";
  dynamic _variacaoBlockchainInfo = "";
  dynamic _bitStamp = "";
  dynamic _variacaoBitStamp = "";
  dynamic _mercadoBitcoin = "";
  dynamic _variacaoMercadoBitcoin = "";
  dynamic _coinbase = "";
  dynamic _variacaoCoinbase = "";
  dynamic _foxBit = "";
  dynamic _variacaoFoxBit = "";

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

  _buscarMoedas() async {
    const String urlHgFinancas =
        "https://api.hgbrasil.com/finance?format=json-cors&key=0cd11e94";
    Response resposta = await get(Uri.parse(urlHgFinancas));
    Map cotacao = json.decode(resposta.body);

    setState(() {
      _valorDolar = cotacao["results"]["currencies"]["USD"]["buy"];
      _valorEuro = cotacao["results"]["currencies"]["EUR"]["buy"];
      _valorPeso = cotacao["results"]["currencies"]["ARS"]["buy"];
      _valorYen = cotacao["results"]["currencies"]["JPY"]["buy"];

      _variacaoDolar = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoEuro = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoPeso = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoYen = cotacao["results"]["currencies"]["JPY"]["variation"];

      _blockchainInfo =
          cotacao["results"]["bitcoin"]["blockchain_info"]["last"];
      _bitStamp = cotacao["results"]["bitcoin"]["bitstamp"]["last"];
      _mercadoBitcoin = cotacao["results"]["bitcoin"]["mercadobitcoin"]["last"];
      _coinbase = cotacao["results"]["bitcoin"]["coinbase"]["last"];
      _foxBit = cotacao["results"]["bitcoin"]["foxbit"]["last"];

      _variacaoBlockchainInfo =
          cotacao["results"]["bitcoin"]["blockchain_info"]["variation"];
      _variacaoBitStamp =
          cotacao["results"]["bitcoin"]["bitstamp"]["variation"];
      _variacaoMercadoBitcoin =
          cotacao["results"]["bitcoin"]["mercadobitcoin"]["variation"];
      _variacaoCoinbase =
          cotacao["results"]["bitcoin"]["coinbase"]["variation"];
      _variacaoFoxBit = cotacao["results"]["bitcoin"]["foxbit"]["variation"];

      _ibovespa = cotacao["results"]["stocks"]["IBOVESPA"]["points"];
      _ifix = cotacao["results"]["stocks"]["IFIX"]["points"];
      _nasdaq = cotacao["results"]["stocks"]["NASDAQ"]["points"];
      _dowjones = cotacao["results"]["stocks"]["DOWJONES"]["points"];
      _cac = cotacao["results"]["stocks"]["CAC"]["points"];
      _nikkei = cotacao["results"]["stocks"]["NIKKEI"]["points"];

      _variacaoIbovespa = cotacao["results"]["stocks"]["IBOVESPA"]["variation"];
      _variacaoIfix = cotacao["results"]["stocks"]["IFIX"]["variation"];
      _variacaoNasdaq = cotacao["results"]["stocks"]["NASDAQ"]["variation"];
      _variacaoDowjones = cotacao["results"]["stocks"]["DOWJONES"]["variation"];
      _variacaoCac = cotacao["results"]["stocks"]["CAC"]["variation"];
      _variacaoNikkei = cotacao["results"]["stocks"]["NIKKEI"]["variation"];
    });
  }

  _irAcoes() {
    ApiValor a = ApiValor(
        _ibovespa,
        _variacaoIbovespa,
        _nasdaq,
        _variacaoNasdaq,
        _cac,
        _variacaoCac,
        _ifix,
        _variacaoIfix,
        _dowjones,
        _variacaoDowjones,
        _nikkei,
        _variacaoNikkei,
        _blockchainInfo,
        _variacaoBlockchainInfo,
        _bitStamp,
        _variacaoBitStamp,
        _mercadoBitcoin,
        _variacaoMercadoBitcoin,
        _coinbase,
        _variacaoCoinbase,
        _foxBit,
        _variacaoFoxBit);
    Navigator.pushNamed(context, "/pgAcoes", arguments: a);
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
                            valor: _valorDolar,
                            variacao: _variacaoDolar),
                        TextoVariacao(
                            nome: "Euro",
                            valor: _valorEuro,
                            variacao: _variacaoEuro)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextoVariacao(
                            nome: "Peso",
                            valor: _valorPeso,
                            variacao: _variacaoPeso),
                        TextoVariacao(
                            nome: "Yen",
                            valor: _valorYen,
                            variacao: _variacaoYen)
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
