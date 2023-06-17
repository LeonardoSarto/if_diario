import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoFormularioTexto extends StatelessWidget {
  final String campoTexto;
  final Widget? widgetSufixo;
  final Widget? widgetPrefixo;
  final TextEditingController? controlador;
  final String? Function(String?)? validacao;
  final List<TextInputFormatter>? mascara;
  final TextInputType? tipoTeclado;

  const CampoFormularioTexto({required this.campoTexto,
    this.controlador,
    this.widgetSufixo,
    this.widgetPrefixo,
    this.validacao,
    this.mascara,
    this.tipoTeclado,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: campoTexto,
        suffix: widgetSufixo,
        prefixIcon: widgetPrefixo,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
      ),
      keyboardType: tipoTeclado,
      inputFormatters: mascara,
      validator: validacao,
      controller: controlador,
    );
  }
}
