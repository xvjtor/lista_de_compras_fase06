import 'package:app_lista_de_compras/model/lista_model.dart';
import 'package:app_lista_de_compras/pages/criar_lista_page.dart';
import 'package:app_lista_de_compras/pages/user_preference_page.dart';

import 'package:app_lista_de_compras/widgets/lista_home_widget.dart';
import 'package:app_lista_de_compras/widgets/lista_vazia_widget.dart';
import 'package:flutter/material.dart';

class ListasHomepage extends StatefulWidget {
  const ListasHomepage({super.key});

  @override
  State<ListasHomepage> createState() => _ListasHomepageState();
}

class _ListasHomepageState extends State<ListasHomepage> {
  final List<Lista> listas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          key: Key("tittleAppBar"),
          "Minhas listas",
          style: TextStyle(color: Colors.white, fontWeight: .w500),
        ),

        actions: [
          Icon(Icons.diamond, color: Colors.amber, size: 30),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => UserPreference()));
            },
            icon: const Icon(Icons.settings, color: Colors.white, size: 30),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: Key("btnAddList"),

        onPressed: () async {
          final novaLista = await Navigator.push<Lista>(
            context,
            MaterialPageRoute(builder: (context) => CriarListaPage()),
          );

          if (novaLista != null) {
            setState(() {
              listas.add(novaLista);
            });
          }
        },

        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: listas.isEmpty ? listaVazia() : ListaHomeWidget(lista: listas),
    );
  }
}
