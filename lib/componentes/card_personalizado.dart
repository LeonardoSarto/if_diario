import 'package:flutter/material.dart';

class CardPersonalizado extends StatelessWidget {
  final List<Widget> listaWidgets;
  const CardPersonalizado({required this.listaWidgets, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: listaWidgets
      ),
    );
  }
}
