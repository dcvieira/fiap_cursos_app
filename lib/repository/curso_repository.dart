import '../models/curso_model.dart';

class CursoRepository {
  List<CursoModel> findAll() {
    return <CursoModel>[
      CursoModel(
          id: 1,
          nome: 'Java',
          nivel: 'Básico',
          percentualConclusao: 0.9,
          preco: 1000),
      CursoModel(
          id: 1,
          nome: 'J2EE',
          nivel: 'Avançado',
          percentualConclusao: 0.8,
          preco: 1000),
      CursoModel(
          id: 1,
          nome: 'Dart',
          nivel: 'Básico',
          percentualConclusao: 0.2,
          preco: 1000),
      CursoModel(
          id: 1,
          nome: 'Android',
          nivel: 'Avançado',
          percentualConclusao: 0,
          preco: 1000),
      CursoModel(
          id: 1,
          nome: 'IOS',
          nivel: 'Avançado',
          percentualConclusao: 0.5,
          preco: 1000),
      CursoModel(
          id: 1,
          nome: 'Javascript',
          nivel: 'Avançado',
          percentualConclusao: 1,
          preco: 1000),
    ];
  }
}
