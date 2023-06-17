import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dto/pessoa.dart';
import 'package:if_diario/banco_dados/dto/tipo_pessoa.dart';

class Aluno extends Pessoa {
  int? id;
  String ra;
  Curso curso;

  Aluno(
      {required super.nome,
        required super.telefone,
        this.id,
        super.tipoPessoa = TipoPessoa.ALUNO,
        required super.cpf,
        required super.email,
        required this.curso,
        required this.ra});

  Aluno.cadastro(
      {required super.nome,
        required super.telefone,
        this.id,
        super.tipoPessoa = TipoPessoa.ALUNO,
        required super.cpf,
        required super.email,
        this.ra = "",
        this.curso = const Curso.cadastro()});

  static Aluno converterAluno(Map<dynamic, dynamic> resultado) {
    return Aluno.cadastro(
        id: resultado['id'],
        nome: resultado['nome'],
        telefone: resultado['telefone'],
        email: resultado['email'],
        cpf: resultado['cpf']);
  }
}