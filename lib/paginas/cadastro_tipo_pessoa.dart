import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/mock_dados.dart';
import 'package:if_diario/componentes/campo_formulario_selecao.dart';
import 'package:if_diario/componentes/campo_formulario_texto.dart';
import 'package:if_diario/componentes/card_personalizado.dart';

class CadastroTipoPessoa extends StatefulWidget {
  const CadastroTipoPessoa({Key? key}) : super(key: key);

  @override
  State<CadastroTipoPessoa> createState() => _CadastroTipoPessoaState();
}

class _CadastroTipoPessoaState extends State<CadastroTipoPessoa> {
  @override
  Widget build(BuildContext context) {
    Pessoa pessoa = Pessoa.cadastro();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fluxo de Cadastro"),
      ),
      body: Center(
        child: Form(
            child: Column(children: [
          Text("Que tipo de pessoa você é dentro do Campus?"),
          Wrap(
            children: [
              CardPersonalizado(
                listaWidgets: [
                  Image.network(
                    "https://cdn.dribbble.com/users/6273831/screenshots/18259879/__________________1.png",
                    scale: 8,
                  ),
                  Text("Aluno")
                ],
              ),
              CardPersonalizado(listaWidgets: [
                Image.network(
                  "https://i.pinimg.com/originals/19/46/9a/19469aed7f222d6009f48158a682bb9c.png",
                  scale: 4,
                ),
                Text("Professor")
              ]),
            ],
          )
        ])),
      ),
    );
  }
}
