import 'package:flutter/material.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';

class PgBitcoin extends StatefulWidget {
  const PgBitcoin({super.key});

  @override
  State<PgBitcoin> createState() => _PgBitcoinState();
}

class _PgBitcoinState extends State<PgBitcoin> {

  @override
  Widget build(BuildContext context) {

    final financas = ModalRoute.of(context)!.settings.arguments as ApiValor;

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
                            valor: financas.bitcoins!.blockchainInfo!.valor,
                            variacao: financas.bitcoins!.blockchainInfo!.variacao),
                        TextoVariacao(
                            nome: "BitStamp",
                            valor: financas.bitcoins!.bitStamp!.valor,
                            variacao: financas.bitcoins!.bitStamp!.variacao),
                        TextoVariacao(
                            nome: "Mercado Bitcoin",
                            valor: financas.bitcoins!.mercadoBitcoin!.valor,
                            variacao: financas.bitcoins!.mercadoBitcoin!.variacao),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        TextoVariacao(
                            nome: "CoinBase",
                            valor: financas.bitcoins!.coinBase!.valor,
                            variacao: financas.bitcoins!.coinBase!.variacao),
                        TextoVariacao(
                            nome: "FoxBit",
                            valor: financas.bitcoins!.foxBit!.valor,
                            variacao: financas.bitcoins!.foxBit!.variacao)
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
