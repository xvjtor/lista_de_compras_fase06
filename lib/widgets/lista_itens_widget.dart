import 'package:app_lista_de_compras/model/item_model.dart';

import 'package:flutter/material.dart';

class ListaItensWidget extends StatefulWidget {
  final Item item;
  const ListaItensWidget({super.key, required this.item});

  @override
  State<ListaItensWidget> createState() => _ListaItensWidgetState();
}

class _ListaItensWidgetState extends State<ListaItensWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(right: 20, left: 5, bottom: 5),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              key: Key("productCheckbox"),
              onChanged: (value) {
                setState(() {
                  widget.item.changeStatus(value!);
                });
              },
              value: widget.item.marcado,
              activeColor: Colors.green,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.blue, width: 1),
            ),
          ),
          SizedBox(width: 10),
          Text(
            widget.item.itemNome,
            style: TextStyle(
              fontSize: 18,
              color: widget.item.marcado
                  ? Colors.grey
                  : Theme.of(context).textTheme.titleMedium!.color,
            ),
          ),
          Spacer(),
          Text(
            "R\$ ${widget.item.valorItem.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
