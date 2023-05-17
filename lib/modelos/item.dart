class Item {

  dynamic nome;
  dynamic valor;
  dynamic variacao;

  Item(this.nome, this.valor, this.variacao);

  Item.iniciar() {
    nome = "";
    valor = 0;
    variacao = 0;
  }

}