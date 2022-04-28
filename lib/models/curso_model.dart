class CursoModel {
  int id;
  String nome;
  String nivel;
  double percentualConclusao;
  int preco;
  String conteudo;

  CursoModel({
    required this.id,
    required this.nome,
    required this.nivel,
    this.percentualConclusao = 0,
    required this.preco,
    this.conteudo = '',
  });
}
