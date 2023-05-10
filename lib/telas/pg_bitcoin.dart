import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';

class PgBitcoin extends StatefulWidget {
  const PgBitcoin({super.key});

  @override
  State<PgBitcoin> createState() => _PgBitcoinState();
}

class _PgBitcoinState extends State<PgBitcoin> {
  dynamic _blockchainInfo = "";
  dynamic _bitStamp = "";
  dynamic _mercadoBitcoin = "";
  dynamic _coinbase = "";
  dynamic _foxBit = "";

  dynamic _variacaoBlockchainInfo = "";
  dynamic _variacaoBitStamp = "";
  dynamic _variacaoMercadoBitcoin = "";
  dynamic _variacaoCoinbase = "";
  dynamic _variacaoFoxBit = "";

  @override
  Widget build(BuildContext context) {

    final a = ModalRoute.of(context)!.settings.arguments as ApiValor;

    irMoedas() {
      Navigator.pop(context);
    }

    criaBody() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Center(
              child: Text(
                "Bitcoin",
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
                      children: [
                        TextoVariacao(
                            nome: "Blockchain.info",
                            valor: a.blockchainInfo,
                            variacao: a.variacaoBlockchainInfo),
                        TextoVariacao(
                            nome: "BitStamp",
                            valor: a.bitStamp,
                            variacao: a.variacaoBitStamp),
                        TextoVariacao(
                            nome: "Mercado Bitcoin",
                            valor: a.mercadoBitcoin,
                            variacao: a.variacaoMercadoBitcoin),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        TextoVariacao(
                            nome: "CoinBase",
                            valor: a.coinbase,
                            variacao: a.variacaoCoinbase),
                        TextoVariacao(
                            nome: "FoxBit",
                            valor: a.foxBit,
                            variacao: a.variacaoFoxBit)
                      ],
                    ))
                  ],
                ),
              ),
            ),
            Botao(
              texto: "Página Principal",
              funcao: irMoedas,
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
