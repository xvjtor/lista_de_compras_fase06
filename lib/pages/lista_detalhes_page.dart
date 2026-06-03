import 'package:app_lista_de_compras/model/item_model.dart';
import 'package:app_lista_de_compras/model/lista_model.dart';

import 'package:app_lista_de_compras/widgets/add_item_widget.dart';
import 'package:app_lista_de_compras/widgets/lista_itens_widget.dart';

import 'package:app_lista_de_compras/widgets/resumo_lista_widget.dart';

import 'package:flutter/material.dart';

class ListaDetalhesPage extends StatefulWidget {
  final Lista lista;

  const ListaDetalhesPage({super.key, required this.lista});

  @override
  State<ListaDetalhesPage> createState() => _ListaDetalhesState();
}

class _ListaDetalhesState extends State<ListaDetalhesPage> {
  void addItem() async {
    final novoItem = await showModalBottomSheet<Item>(
      
      isScrollControlled: true,

      context: context,
      builder: (ctx) {
        return AddItemWidget();
      },
    );

    if (novoItem != null) {
      setState(() {
        widget.lista.itens.add(novoItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: .symmetric(horizontal: 10),

        actions: [
          TextButton(
            key: Key("updateListBtn"),
            onPressed: () {
              setState(() {});
            },
            child: Text(
              "Atualizar",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  widget.lista.nomeLista,
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
                Divider(color: Colors.grey),
              ],
            ),
          ),

          SingleChildScrollView(
            child: ListView.builder(
              padding: .zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.lista.itens.length + 1,
              itemBuilder: (context, index) {
                if (index < widget.lista.itens.length) {
                  final item = widget.lista.itens[index];
                  return ListaItensWidget(item: item);
                }
                return ResumoListaWidget(
                  totalMarcado: widget.lista.valorMarcados,
                  totalNaoMarcado: widget.lista.valorNaoMarcados,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: Key("addNewItemBtn"),
        onPressed: () {
          addItem();
        },

        label: Text(
          "Adicionar",
          style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1),
        ),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: .circular(30)),
      ),
    );
  }
}
