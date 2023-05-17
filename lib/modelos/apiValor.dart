import 'package:prova_pratica_versao_final/modelos/acoes.dart';
import 'package:prova_pratica_versao_final/modelos/bitcoins.dart';
import 'package:prova_pratica_versao_final/modelos/moedas.dart';

class ApiValor {

  Moedas? moedas;
  Acoes? acoes;
  Bitcoins? bitcoins;

  ApiValor(this.moedas, this.acoes, this.bitcoins);

  ApiValor.iniciar() {
    moedas = Moedas.iniciar();
    acoes = Acoes.iniciar();
    bitcoins = Bitcoins.iniciar();
  }
}