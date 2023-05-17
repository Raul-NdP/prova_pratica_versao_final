import 'package:prova_pratica_versao_final/modelos/item.dart';

class Moedas {

  Item? dolar;
  Item? euro;
  Item? peso;
  Item? yen;

  Moedas(this.dolar, this.euro, this.peso, this.yen);

  Moedas.iniciar() {
    dolar = Item.iniciar();
    euro = Item.iniciar();
    peso = Item.iniciar();
    yen = Item.iniciar();
  }

}