import 'package:app_lista_de_compras/model/lista_model.dart';
import 'package:app_lista_de_compras/themes/app_colors.dart';

import 'package:flutter/material.dart';

class CriarListaPage extends StatefulWidget {
  const CriarListaPage({super.key});

  @override
  State<CriarListaPage> createState() => _CriarListaPageState();
}

class _CriarListaPageState extends State<CriarListaPage> {
  void criarLista() {
    if (nomeListaController.text.trim().isEmpty) return;

    final novalista = Lista(nomeLista: nomeListaController.text);
    Navigator.of(context).pop(novalista);
  }

  final nomeListaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return Scaffold(
      backgroundColor: appColors!.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Flexible(
              flex: 10,
              child: Align(
                alignment: .center,
                child: TextFormField(
                  key: Key("listNameInput"),

                  controller: nomeListaController,
                  style: Theme.of(context).textTheme.labelSmall,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text(
                      "Nome da lista",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Expanded(
                child: Align(
                  alignment: .bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            key: Key("backToListsBtn"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(color: Colors.white),
                            ),
                            child: Text(
                              "Voltar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: OutlinedButton(
                            key: Key("createListBtn"),
                            onPressed: () {
                              criarLista();
                            },
                            style: OutlinedButton.styleFrom(
                              elevation: 2,
                              shadowColor: Colors.black,
                            ),

                            child: Text(
                              "Criar",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
