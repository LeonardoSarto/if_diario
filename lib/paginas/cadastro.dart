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
  List<Turma> listaTurmas = [
    Turma(nome: "Engenharia de Software", ano: "1"),
    Turma(nome: "Engenharia Elétrica", ano: "1"),
    Turma(nome: "Teste", ano: "1"),
    Turma(nome: "Engenharia de Software", ano: "1"),
  ];
  Aluno aluno =
      Aluno(nome: "Leonardo", turma: "Engenharia de Software", ra: "564");
  bool mostrarSenha = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("If diário"),
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
            listaItens: listaTurmas,
            dropdownMenuItem: (value) => DropdownMenuItem(
                value: value,
                child: Text(value.nome),
            ),
            valorInicial: listaTurmas.first,
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
