import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dto/pessoa.dart';
import 'package:if_diario/banco_dados/dto/tipo_pessoa.dart';

class Professor extends Pessoa {
  int? id;
  String ra;

  Professor(
      {required super.nome,
      required super.telefone,
      this.id,
      super.tipoPessoa = TipoPessoa.PROFESSOR,
      required super.cpf,
      required super.email,
      required this.ra});

  Professor.cadastro(
      {required super.nome,
      required super.telefone,
      this.id,
      super.tipoPessoa = TipoPessoa.PROFESSOR,
      required super.cpf,
      required super.email,
      this.ra = ""});

  static Professor converterProfessor(Map<dynamic, dynamic> resultado) {
    return Professor.cadastro(
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
