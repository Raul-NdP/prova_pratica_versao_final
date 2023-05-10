import 'package:flutter/material.dart';

class TextoVariacao extends StatefulWidget {

  final nome;
  final valor;
  final variacao;

  const TextoVariacao({super.key, this.variacao, this.valor, this.nome});

  @override
  State<TextoVariacao> createState() => _TextoVariacaoState();
}

class _TextoVariacaoState extends State<TextoVariacao> {
  @override
  Widget build(BuildContext context) {

    Color corContainer = Colors.red;
    if (widget.variacao > 0) {
      corContainer = Colors.blue;
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.nome.toString()),
          Row(
            children: [
              Text(
                widget.valor.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: corContainer,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      widget.variacao.toString(),
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}