import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/mock_dados.dart';
import 'package:if_diario/componentes/campo_formulario_selecao.dart';
import 'package:if_diario/componentes/campo_formulario_texto.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    Aluno aluno =
        Aluno.personalizado(nome: "Leonardo", ra: "564", cpf: "097.560.179-29");
    List<Curso> listaTurmas = [
      Curso(nome: "Engenharia de Software", ano: "1"),
      Curso(nome: "Engenharia Elétrica", ano: "1"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fluxo de cadastro"),
      ),
      body: Center(
        child: Form(
            child: Column(children: [
          Image.asset(aluno.urlAvatar, scale: 3),
          Spacer(),
          Flexible(flex: 2, child: CampoFormularioTexto(campoTexto: "Nome")),
          Spacer(),
          Flexible(flex: 2, child: CampoFormularioTexto(campoTexto: "RA")),
          Spacer(),
          CampoFormularioSelecao(
            campoTexto: "Informe o curso do seu interesse",
            listaItens: listaTurmas,
            valorInicial: listaTurmas.first,
            dropdownMenuItem: (value) => DropdownMenuItem(
              value: value,
              child: Text(value.nome),
            ),
          ),
          Spacer(),
          Flexible(
              flex: 2,
              child: FilledButton(onPressed: () {}, child: Text("Continuar"))),
          Spacer(),
        ])),
      ),
    );
  }
}
