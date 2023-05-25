class Pessoa {
  String nome;
  String cpf;
  String urlAvatar;
  TipoPessoa tipoPessoa;

  Pessoa(
      {required this.nome,
      required this.cpf,
      required this.tipoPessoa,
      this.urlAvatar = "assets/images/avatar.png"});

  Pessoa.cadastro(
      {this.nome = "",
        this.cpf = "",
        this.tipoPessoa = TipoPessoa.ALUNO,
        this.urlAvatar = "assets/images/avatar.png"});
}

class Aluno extends Pessoa {
  String ra;
  Curso curso;

  Aluno(
      {required super.nome,
      super.tipoPessoa = TipoPessoa.ALUNO,
      required super.cpf,
      required this.curso,
      required this.ra});

  Aluno.personalizado(
      {required super.nome,
      super.tipoPessoa = TipoPessoa.ALUNO,
      required super.cpf,
      this.ra = "",
      this.curso = const Curso.personalizado()});
}

class Curso {
  final String nome;
  final String ano;

  Curso({required this.nome, required this.ano});

  const Curso.personalizado({this.nome = "", this.ano = ""});
}

enum TipoPessoa { COMUNIDADE_EXTERNA, ALUNO, RESPONSAVEL, PROFESSOR }
