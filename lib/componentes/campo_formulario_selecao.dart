import 'package:flutter/material.dart';

class CampoFormularioSelecao extends StatelessWidget {
  final List<dynamic> listaItens;
  Object? valorSelecao;
  Object? valorInicial;
  DropdownMenuItem<dynamic> Function(dynamic) dropdownMenuItem;
  final String? Function(dynamic)? validacao;

  CampoFormularioSelecao(
      {required this.listaItens,
      required this.dropdownMenuItem,
      this.valorSelecao,
      this.valorInicial,
      this.validacao,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: valorInicial,
      onChanged: (value) {},
      items: listaItens
          .map<DropdownMenuItem>(dropdownMenuItem)
          .toList(),
      decoration: InputDecoration(
        labelText: "Informe sua turma",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
      ),
      validator: validacao,
    );
  }
}
