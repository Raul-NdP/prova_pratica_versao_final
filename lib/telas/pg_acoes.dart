import 'package:flutter/material.dart';
import 'package:prova_pratica_versao_final/componentes/botao.dart';
import 'package:prova_pratica_versao_final/componentes/componenteItem.dart';
import 'package:prova_pratica_versao_final/modelos/acoes.dart';
import 'package:prova_pratica_versao_final/modelos/financas.dart';
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

    final financas = ModalRoute.of(context)!.settings.arguments as Financas;
    
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
                          ComponenteItem(
                              nome: "IBOVESPA",
                              valor: financas.acoes!.ibovespa!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.ibovespa!.variacao.toStringAsFixed(2)),
                          ),
                          ComponenteItem(
                              nome: "NASDAQ",
                              valor: financas.acoes!.nasdaq!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.nasdaq!.variacao.toStringAsFixed(2)),
                          ),
                          ComponenteItem(
                              nome: "CAC",
                              valor: financas.acoes!.cac!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.cac!.variacao.toStringAsFixed(2)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ComponenteItem(
                              nome: "IFIX",
                              valor: financas.acoes!.ifix!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.ifix!.variacao.toStringAsFixed(2)),
                          ),
                          ComponenteItem(
                              nome: "DOWJONES",
                              valor: financas.acoes!.dowjones!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.dowjones!.variacao.toStringAsFixed(2)),
                          ),
                          ComponenteItem(
                              nome: "NIKKEI",
                              valor: financas.acoes!.nikkei!.valor.toStringAsFixed(2),
                              variacao: double.parse(financas.acoes!.nikkei!.variacao.toStringAsFixed(2)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Botao(
              texto: "Ir para Bitcoin",
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
