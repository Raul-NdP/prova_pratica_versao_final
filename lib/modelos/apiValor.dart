class ApiValor {

  double ibovespa = 0;
  double variacaoIbovespa = 0;
  double nasdaq = 0;
  double variacaoNasdaq = 0;
  double cac = 0;
  double variacaoCac = 0;
  double ifix = 0;
  double variacaoIfix = 0;
  double dowjones = 0;
  double variacaoDowjones = 0;
  double nikkei = 0;
  double variacaoNikkei = 0;

  double blockchainInfo;
  double variacaoBlockchainInfo;
  double bitStamp;
  double variacaoBitStamp;
  double mercadoBitcoin;
  double variacaoMercadoBitcoin;
  double coinbase;
  double variacaoCoinbase;
  double foxBit ;
  double variacaoFoxBit;

  ApiValor(
    this.ibovespa,
    this.variacaoIbovespa,
    this.nasdaq,
    this.variacaoNasdaq,
    this.cac,
    this.variacaoCac,
    this.ifix,
    this.variacaoIfix,
    this.dowjones,
    this.variacaoDowjones,
    this.nikkei,
    this.variacaoNikkei,
    this.blockchainInfo,
    this.variacaoBlockchainInfo,
    this.bitStamp,
    this.variacaoBitStamp,
    this.mercadoBitcoin,
    this.variacaoMercadoBitcoin,
    this.coinbase,
    this.variacaoCoinbase,
    this.foxBit,
    this.variacaoFoxBit
  );

  ApiValor.dois(
    this.blockchainInfo,
    this.variacaoBlockchainInfo,
    this.bitStamp,
    this.variacaoBitStamp,
    this.mercadoBitcoin,
    this.variacaoMercadoBitcoin,
    this.coinbase,
    this.variacaoCoinbase,
    this.foxBit,
    this.variacaoFoxBit
  );
}