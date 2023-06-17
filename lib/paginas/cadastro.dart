import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dados_exemplo/mock_dados.dart';
import 'package:if_diario/banco_dados/interface/dao_generico.dart';
import 'package:if_diario/banco_dados/sqlite/dao/curso_dao_sqlite.dart';
import 'package:if_diario/componentes/campo_formulario_selecao.dart';
import 'package:if_diario/componentes/campo_formulario_texto.dart';
import 'package:if_diario/rota.dart';
import 'package:if_diario/utils/util.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Aluno aluno =
        Aluno.cadastro(nome: "", ra: "", cpf: "", telefone: "", email: "");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fluxo de cadastro"),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Stack(
              children: [
                Image.asset(aluno.urlAvatar, scale: 4),
                Positioned(
                  width: 45,
                  height: 45,
                  bottom: 5, right: 10,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                      child: const Icon(Icons.camera_alt)
                  ),
                ),
              ]
          ),
          const Spacer(),
          Flexible(
              flex: 4,
              child: CampoFormularioTexto(
                campoTexto: "Nome",
                tipoTeclado: TextInputType.name,
                validacao: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nome obrigatório";
                  }
                  return null;
                },
              )),
          const Spacer(),
          Flexible(
              flex: 4,
              child: CampoFormularioTexto(
                  campoTexto: "RA",
                  mascara: [Util.mascaraRa],
                  tipoTeclado: TextInputType.number,
                  validacao: (value) {
                    RegExp regExp = RegExp(Util.regexCelular);
                    if (value == null || value.isEmpty) {
                      return "RA obrigatório";
                    }
                    if (!regExp.hasMatch(value)) {
                      return "RA inválido";
                    }
                    return null;
                  })),
          const Spacer(),
          Flexible(
              flex: 4,
              child: CampoFormularioTexto(
                  campoTexto: "Telefone",
                  tipoTeclado: TextInputType.phone,
                  mascara: [Util.mascaraTelefone],
                  validacao: (value) {
                    RegExp regExp = RegExp(Util.regexCelular);
                    if (value == null || value.isEmpty) {
                      return "Telefone obrigatório";
                    }
                    if (!regExp.hasMatch(value)) {
                      return "Telefone inválido";
                    }
                    return null;
                  })),
          const Spacer(),
          Flexible(
              flex: 3,
              child: FilledButton(
                child: const Text("Continuar"),
                onPressed: () {
                  Navigator.pushNamed(context, Rota.cadastroCurso);
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
              )),
        ]),
      ),
    );
  }
}
