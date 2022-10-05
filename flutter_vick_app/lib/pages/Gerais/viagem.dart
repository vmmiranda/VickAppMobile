import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/viagem.dart';

class Travel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Viagens"),
        ),
        body: _body());
  }

  _body() {
    List<Viagem> viagens = [
      Viagem("Curitiba - PR", "imagens/curitiba.jpg"),
      Viagem("Itararé - SP", "imagens/itarare.jpg"),
      Viagem("Foz do Iguaçu - PR", "imagens/foz.jpg"),
      Viagem("Trindade - RJ", "imagens/trindade.jpg"),
      Viagem("Templo Zulai / Viniculas de São Roque - SP", "imagens/zulai.jpg"),
      Viagem("Ilha Grande - RJ", "imagens/ilhagrande.jpg"),
      Viagem("Capitólio - MG", "imagens/capitolio.jpg"),
      Viagem("Campos de Jordão - SP", "imagens/campos.jpg"),
      Viagem("Arraial do Cabo - RJ", "imagens/arraial.jpg")
    ];
    return ListView.builder(
      itemCount: viagens.length,
      itemExtent: 390,
      itemBuilder: (BuildContext context, int index) {
        return _itemView(viagens, index);
      },
    );
  }

  _itemView(List<Viagem> viagens, int index) {
    Viagem viagem = viagens[index];
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _imagem(viagem.imagem),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Text(
              viagem.nome,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  _imagem(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
