import 'package:flutter/material.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/textoVariacao.dart';
import 'package:prova_pratica_versao_final/modelos/acoes.dart';
import 'package:prova_pratica_versao_final/modelos/apiValor.dart';
import 'package:prova_pratica_versao_final/modelos/bitcoins.dart';
import 'package:prova_pratica_versao_final/modelos/moedas.dart';

class PgAcoes extends StatefulWidget {
  const PgAcoes({super.key});

  @override
  State<PgAcoes> createState() => _PgAcoesState();
}

class _PgAcoesState extends State<PgAcoes> {

  Moedas? moedas;
  Acoes? acoes;
  Bitcoins? bitcoins;

  @override
  Widget build(BuildContext context) {

    final financas = ModalRoute.of(context)!.settings.arguments as ApiValor;
    
    irBitcoin() {
      Navigator.popAndPushNamed(context, "/pgBitcoin", arguments: financas);
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
                              valor: financas.acoes!.ibovespa!.valor,
                              variacao: financas.acoes!.ibovespa!.variacao),
                          TextoVariacao(
                              nome: "NASDAQ",
                              valor: financas.acoes!.nasdaq!.valor,
                              variacao: financas.acoes!.nasdaq!.variacao),
                          TextoVariacao(
                              nome: "CAC",
                              valor: financas.acoes!.cac!.valor,
                              variacao: financas.acoes!.cac!.variacao),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextoVariacao(
                              nome: "IFIX",
                              valor: financas.acoes!.ifix!.valor,
                              variacao: financas.acoes!.ifix!.variacao),
                          TextoVariacao(
                              nome: "DOWJONES",
                              valor: financas.acoes!.dowjones!.valor,
                              variacao: financas.acoes!.dowjones!.variacao),
                          TextoVariacao(
                              nome: "NIKKEI",
                              valor: financas.acoes!.nikkei!.valor,
                              variacao: financas.acoes!.nikkei!.variacao),
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
