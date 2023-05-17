import 'package:prova_pratica_versao_final/modelos/item.dart';

class Acoes {

  Item? ibovespa;
  Item? nasdaq;
  Item? cac;
  Item? ifix;
  Item? dowjones;
  Item? nikkei;

  Acoes(this.ibovespa, this.nasdaq, this.cac, this.ifix, this.dowjones, this.nikkei);

  Acoes.iniciar() {
    ibovespa = Item.iniciar();
    nasdaq = Item.iniciar();
    cac = Item.iniciar();
    ifix = Item.iniciar();
    dowjones = Item.iniciar();
    nikkei = Item.iniciar();
  }

}