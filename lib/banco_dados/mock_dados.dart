class Aluno {
  String nome;
  String turma;
  String ra;
  String urlAvatar;

  Aluno({required this.nome, required this.turma, required this.ra, this.urlAvatar = "assets/images/avatar.png"});
}

class Turma {
  String nome;
  String ano;

  Turma({required this.nome, required this.ano});
}