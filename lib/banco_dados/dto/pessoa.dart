import 'package:if_diario/banco_dados/dto/tipo_pessoa.dart';

class Pessoa {
  String nome;
  String cpf;
  String urlAvatar;
  String telefone;
  String email;
  TipoPessoa tipoPessoa;

  Pessoa(
      {required this.nome,
        required this.cpf,
        required this.tipoPessoa,
        required this.email,
        required this.telefone,
        this.urlAvatar = "assets/images/student.png"});

  Pessoa.cadastro(
      {this.nome = "",
        this.cpf = "",
        this.telefone = "",
        this.email = "",
        this.tipoPessoa = TipoPessoa.ALUNO,
        this.urlAvatar = "assets/images/student.png"});
}