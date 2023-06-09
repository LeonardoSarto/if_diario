import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dto/pessoa.dart';
import 'package:if_diario/banco_dados/dto/tipo_pessoa.dart';

class Aluno extends Pessoa {
  int? id;
  String ra;

  Aluno(
      {required super.nome,
      required super.telefone,
      this.id,
      super.tipoPessoa = TipoPessoa.ALUNO,
      required super.cpf,
      required super.email,
      required this.ra});

  Aluno.cadastro(
      {required super.nome,
      required super.telefone,
      this.id,
      super.tipoPessoa = TipoPessoa.ALUNO,
      required super.cpf,
      required super.email,
      this.ra = ""});

  static Aluno converterAluno(Map<dynamic, dynamic> resultado) {
    return Aluno.cadastro(
        id: resultado['id'],
        nome: resultado['nome'],
        telefone: resultado['telefone'],
        email: resultado['email'],
        ra: resultado['ra'],
        cpf: resultado['cpf']);
  }

  @override
  String toString() {
    return "id: $id, nome: $nome, ra: $ra, cpf: $cpf, email: $email, tipo pessoa: ${tipoPessoa.name}, telefone: $telefone";
  }
}
