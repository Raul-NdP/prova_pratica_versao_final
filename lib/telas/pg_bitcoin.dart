import 'package:flutter/material.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/componenteItem.dart';
import 'package:prova_pratica_versao_final/modelos/financas.dart';

class PgBitcoin extends StatefulWidget {
  const PgBitcoin({super.key});

  @override
  State<PgBitcoin> createState() => _PgBitcoinState();
}

class _PgBitcoinState extends State<PgBitcoin> {

  @override
  Widget build(BuildContext context) {

    final financas = ModalRoute.of(context)!.settings.arguments as Financas;

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
                        ComponenteItem(
                            nome: "Blockchain.info",
                            valor: financas.bitcoins!.blockchainInfo!.valor.toStringAsFixed(2),
                            variacao: double.parse(financas.bitcoins!.blockchainInfo!.variacao.toStringAsFixed(3)),
                        ),
                        ComponenteItem(
                            nome: "BitStamp",
                            valor: financas.bitcoins!.bitStamp!.valor.toStringAsFixed(2),
                            variacao: double.parse(financas.bitcoins!.bitStamp!.variacao.toStringAsFixed(3)),
                        ),
                        ComponenteItem(
                            nome: "Mercado Bitcoin",
                            valor: financas.bitcoins!.mercadoBitcoin!.valor.toStringAsFixed(2),
                            variacao: double.parse(financas.bitcoins!.mercadoBitcoin!.variacao.toStringAsFixed(3)),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        ComponenteItem(
                            nome: "CoinBase",
                            valor: financas.bitcoins!.coinBase!.valor.toStringAsFixed(2),
                            variacao: double.parse(financas.bitcoins!.coinBase!.variacao.toStringAsFixed(3)),
                        ),
                        ComponenteItem(
                            nome: "FoxBit",
                            valor: financas.bitcoins!.foxBit!.valor.toStringAsFixed(2),
                            variacao: double.parse(financas.bitcoins!.foxBit!.variacao.toStringAsFixed(3)),
                        )
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
