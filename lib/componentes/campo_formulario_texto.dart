import 'package:flutter/material.dart';

class CampoFormularioTexto extends StatelessWidget {
  final String campoTexto;
  final Widget? widgetSufixo;
  final Widget? widgetPrefixo;
  final TextEditingController? controlador;
  final String? Function(String?)? validacao;

  const CampoFormularioTexto({required this.campoTexto,
    this.controlador,
    this.widgetSufixo,
    this.widgetPrefixo,
    this.validacao,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: campoTexto,
        suffix: widgetSufixo,
        prefixIcon: widgetPrefixo,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
      ),
      validator: validacao,
      controller: controlador,
    );
  }
}
