import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';

class PgAcoes extends StatefulWidget {
  const PgAcoes({super.key});

  @override
  State<PgAcoes> createState() => _PgAcoesState();
}

class _PgAcoesState extends State<PgAcoes> {
  dynamic _blockchainInfo = "";
  dynamic _bitStamp = "";
  dynamic _mercadoBitcoin = "";
  dynamic _coinbase = "";
  dynamic _foxBit = "";

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

  dynamic _variacaoBlockchainInfo = "";
  dynamic _variacaoBitStamp = "";
  dynamic _variacaoMercadoBitcoin = "";
  dynamic _variacaoCoinbase = "";
  dynamic _variacaoFoxBit = "";


  @override
  Widget build(BuildContext context) {

    final a = ModalRoute.of(context)!.settings.arguments as ApiValor;
    
    irBitcoin() {
      ApiValor b = ApiValor(
        a.ibovespa,
        a.variacaoIbovespa,
        a.nasdaq,
        a.variacaoNasdaq,
        a.cac,
        a.variacaoCac,
        a.ifix,
        a.variacaoIfix,
        a.dowjones,
        a.variacaoDowjones,
        a.nikkei,
        a.variacaoNikkei,
        a.blockchainInfo,
        a.variacaoBlockchainInfo,
        a.bitStamp,
        a.variacaoBitStamp,
        a.mercadoBitcoin,
        a.variacaoMercadoBitcoin,
        a.coinbase,
        a.variacaoCoinbase,
        a.foxBit,
        a.variacaoFoxBit);
      Navigator.popAndPushNamed(context, "/pgBitcoin", arguments: b);
    }

    criaBody() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Center(
              child: Text(
                "Ações",
                style: TextStyle(fontSize: 20),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
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
                              nome: "IBOVESPA",
                              valor: a.ibovespa,
                              variacao: a.variacaoIbovespa),
                          TextoVariacao(
                              nome: "NASDAQ",
                              valor: a.nasdaq,
                              variacao: a.variacaoNasdaq),
                          TextoVariacao(
                              nome: "CAC",
                              valor: a.cac,
                              variacao: a.variacaoCac),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextoVariacao(
                              nome: "IFIX",
                              valor: a.ifix,
                              variacao: a.variacaoIfix),
                          TextoVariacao(
                              nome: "DOWJONES",
                              valor: a.dowjones,
                              variacao: a.variacaoDowjones),
                          TextoVariacao(
                              nome: "NIKKEI",
                              valor: a.nikkei,
                              variacao: a.variacaoNikkei),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Botao(
              texto: "ir para Bitcoin",
              funcao: irBitcoin,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanças de Hoje"),
        backgroundColor: const Color.fromARGB(255, 10, 63, 11),
      ),
      body: criaBody(),
    );
  }

}
