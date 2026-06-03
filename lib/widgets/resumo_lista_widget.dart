import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResumoListaWidget extends StatefulWidget {
  double totalNaoMarcado;
  double totalMarcado;
  ResumoListaWidget({
    super.key,
    required this.totalMarcado,
    required this.totalNaoMarcado,
  });

  @override
  State<ResumoListaWidget> createState() => _ResumoListaWidgetState();
}

class _ResumoListaWidgetState extends State<ResumoListaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: .start,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  const Text("Não marcados", style: TextStyle(fontSize: 18)),
                  Text(
                    "R\$ ${widget.totalNaoMarcado.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Marcados", style: TextStyle(fontSize: 18)),
                  Text(
                    "R\$ ${widget.totalMarcado.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
