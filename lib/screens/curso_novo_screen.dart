import 'package:flutter/material.dart';

import '../models/curso_model.dart';

class CursoNovoScreen extends StatefulWidget {
  @override
  _CursoNovoScreenState createState() => _CursoNovoScreenState();
}

class _CursoNovoScreenState extends State<CursoNovoScreen> {
  var formKey = GlobalKey<FormState>();
  var listaNiveis = ["Básico", "Intermediário", "Avançado", "Especializado"];
  String? cursoNome;
  String? cursoNivel;
  int? preco;
  double? percentualConclusao;
  String? conteudo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Novo Curso"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  _buildNomeTextForm(),
                  _buildPrecoTextForm(),
                  _buildConclusaoTextForm(),
                  _builConteudoTextForm(),
                  _buildNivelDropdown(),
                  SizedBox(
                    height: 10,
                  ),
                  // Botão
                  _buildButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(64, 75, 96, .9),
      ),
      child: Text('Cadastrar Curso'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          var cursoModel = CursoModel(
            id: 1,
            nome: cursoNome!,
            nivel: cursoNivel!,
            preco: preco!,
            conteudo: conteudo!,
            percentualConclusao: percentualConclusao!,
          );
          Navigator.pop(context, cursoModel);
        }
      },
    );
  }

  DropdownButtonFormField<String> _buildNivelDropdown() {
    return DropdownButtonFormField<String>(
      items: listaNiveis.map(
        (nivel) {
          return DropdownMenuItem(
            child: Text(nivel),
            value: nivel,
          );
        },
      ).toList(),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        icon: const Icon(Icons.score),
        hintText: 'Selecione o nível',
        labelText: 'Nível',
      ),
      validator: (value) {
        if ((value == null)) {
          return 'Selecione o nível do curso!';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (newValue) {
        cursoNivel = newValue;
      },
    );
  }

  TextFormField _buildNomeTextForm() {
    return TextFormField(
      decoration: new InputDecoration(
        icon: Icon(Icons.text_format_rounded),
        hintText: 'Digite o nome do curso',
        labelText: 'Nome do curso',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Digite o nome do curso';
        } else if (value.length < 2) {
          return 'Nome do curso incorreto';
        }
        return null;
      },
      onSaved: (newValue) {
        cursoNome = newValue;
      },
    );
  }

  TextFormField _buildPrecoTextForm() {
    return TextFormField(
      decoration: new InputDecoration(
        icon: Icon(Icons.monetization_on),
        hintText: 'Digite o preço do curso',
        labelText: 'Preço do curso',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Digite o preço do curso';
        }
        return null;
      },
      onSaved: (newValue) {
        preco = int.parse(newValue!);
      },
    );
  }

  TextFormField _buildConclusaoTextForm() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.monetization_on),
        hintText: 'Digite o % de conclusão do curso',
        labelText: '% de conclusão',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Digite o % de conclusão do curso';
        }
        var conclusao = double.parse(value);
        if (conclusao < 0 || conclusao > 100) {
          return 'Digite um valor entre 0 e 100';
        }
        return null;
      },
      onSaved: (newValue) {
        percentualConclusao = double.parse(newValue!);
      },
    );
  }

  TextFormField _builConteudoTextForm() {
    return TextFormField(
      decoration: new InputDecoration(
        icon: Icon(Icons.text_format_rounded),
        hintText: 'Digite o conteúdo do curso',
        labelText: 'Conteúdo do curso',
      ),
      keyboardType: TextInputType.text,
      maxLength: 100,
      maxLines: 5,
      onSaved: (newValue) {
        conteudo = newValue ?? '';
      },
    );
  }
}
