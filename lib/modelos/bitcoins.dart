import 'package:prova_pratica_versao_final/modelos/item.dart';

class Bitcoins {

  Item? blockchainInfo;
  Item? bitStamp;
  Item? mercadoBitcoin;
  Item? coinBase;
  Item? foxBit;

  Bitcoins(this.blockchainInfo, this.bitStamp, this.mercadoBitcoin, this.coinBase, this.foxBit);

  Bitcoins.iniciar() {
    blockchainInfo = Item.iniciar();
    bitStamp = Item.iniciar();
    mercadoBitcoin = Item.iniciar();
    coinBase = Item.iniciar();
    foxBit = Item.iniciar();
  }

}