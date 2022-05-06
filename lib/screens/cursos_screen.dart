import 'package:fiap_cursos_app/screens/cursos_detalhes_screen.dart';
import 'package:flutter/material.dart';

import '../models/curso_model.dart';
import '../repository/curso_repository.dart';

class CursosScreen extends StatefulWidget {
  @override
  _CursosScreenState createState() => _CursosScreenState();
}

class _CursosScreenState extends State<CursosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Cursos"),
      ),
      body: FutureBuilder<List<CursoModel>>(
        future: CursoRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return cardCurso(data[index]);
                },
              );
            } else {
              return Text('Nenhum curso disponível');
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/curso_detalhes',
            arguments:
                CursoModel(id: 1, nome: 'nome', nivel: 'nivel', preco: 10),
          );
        },
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Card cardCurso(CursoModel curso) {
    return Card(
      elevation: 12.0,
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
          ),
          title: Text(
            curso.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: curso.percentualConclusao,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    curso.nivel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            navegarTelaCursoDetalhes(context, curso);
          },
        ),
      ),
    );
  }

  void navegarTelaCursoDetalhes(ctx, curso) async {
    final retorno = await Navigator.pushNamed(
      ctx,
      "/curso_detalhes",
      arguments: curso,
    );

    CursoModel? cursoModel = retorno as CursoModel?;

    if (cursoModel != null) {
      print(cursoModel.nome);
    }
  }
}
