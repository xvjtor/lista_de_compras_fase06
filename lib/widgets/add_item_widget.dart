import 'package:app_lista_de_compras/model/item_model.dart';
import 'package:app_lista_de_compras/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({super.key});

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final nomeItemController = TextEditingController();
  final valorItemController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addItem() {
    if (!formKey.currentState!.validate()) return;

    final item = Item(
      itemNome: nomeItemController.text,
      valorItem: double.tryParse(valorItemController.text) ?? 0.0,
    );

    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Adicionar item",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(),

            TextfieldWidget(
              color: const Color(0xFF121212),
              key: Key("inputNameItem"),
              text: "Nome do item",
              controller: nomeItemController,
            ),

            TextfieldWidget(
              key: Key("intputPriceItem"),
              color: const Color(0xFF121212),
              text: "R\$ 0,00",
              controller: valorItemController,
              teclado: .numberWithOptions(decimal: true),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Spacer(),
                TextButton(
                  key: Key("btnAddItem"),
                  onPressed: () {
                    addItem();
                  },
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
