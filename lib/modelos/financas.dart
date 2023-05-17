import 'package:prova_pratica_versao_final/modelos/acoes.dart';
import 'package:prova_pratica_versao_final/modelos/bitcoins.dart';
import 'package:prova_pratica_versao_final/modelos/moedas.dart';

class Financas {

  Moedas? moedas;
  Acoes? acoes;
  Bitcoins? bitcoins;

  Financas(this.moedas, this.acoes, this.bitcoins);

  Financas.iniciar() {
    moedas = Moedas.iniciar();
    acoes = Acoes.iniciar();
    bitcoins = Bitcoins.iniciar();
  }
}