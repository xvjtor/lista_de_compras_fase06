

class Item {
  String itemNome;
  double valorItem;
  bool marcado;

  Item({
    required this.itemNome,
    required this.valorItem,
  }) : marcado = false;

  void changeStatus(bool status) {
    marcado = status;
  }
}
