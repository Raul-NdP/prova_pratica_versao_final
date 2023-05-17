import 'package:flutter/material.dart';

class ComponenteItem extends StatefulWidget {

  final dynamic nome;
  final dynamic valor;
  final dynamic variacao;

  const ComponenteItem({super.key, required this.variacao, this.valor, this.nome});

  @override
  State<ComponenteItem> createState() => _ComponenteItemState();
}

class _ComponenteItemState extends State<ComponenteItem> {
  @override
  Widget build(BuildContext context) {

    Color corContainer = widget.variacao >= 0 ? Colors.blue : Colors.red;

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
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
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