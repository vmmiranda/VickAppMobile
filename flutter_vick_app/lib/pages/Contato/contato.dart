import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contato extends StatelessWidget {
  //const Contato({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contato"),
        ),
        body: _body());
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(3.0),
        child: Card(
            child: Container(
                padding: EdgeInsets.all(2.0),
                width: 550,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Column(
                        children: <Widget>[
                          Text(
                              'Bem vindos a Vick Viagens e Turismo, nosso foco é ver a satisfação e alegria no rostinho de cada um de vocês....'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Column(
                        children: <Widget>[
                          Text(''),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 3, 5),
                      child: Column(
                        children: <Widget>[
                          Text('VICK VIAGENS E TURISMO LTDA'),
                          Text('CNPJ: 01.739.114/0001-10'),
                          Text('Tel.: (11) 98704-6280'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 2),
                      child: Column(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "Email: "),
                            TextSpan(
                                text: "agenciavicktrips@gmail.com.br",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    var url =
                                        "mailto:agenciavicktrips@gmail.com.br";
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Não foi possivel enviar o email: $url';
                                    }
                                  }),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 2),
                      child: Column(
                        children: <Widget>[
                          Text(
                              'A natureza é algo que me encanta, me deixa apaixonada a cada dia mais, onde não me canso de conhecer e procurar saber sempre mais e mais, e o desejo de conhecer e explorar novos lugares, conhecer novos rumos a cada dia só aumenta porque quanto mais lugares eu conheço eu percebo que pouco sei desse mistério que me ipinotiza a cada dia....bela demais sem palavras pra expressar o que sinto quando me encontro em contato com a natureza porque é a arte do meu criador tão perfeita que homem nenhum é capaz de fazer algo que seja ao menos semelhante...pode até chegar perto em beleza mas nunca em mistério que só sabe quem aprecia. ..que é a sensação de sentir a natureza em todo o seu ser...'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('imagens/zl.jpg'),
                          Image.asset('imagens/couve.jpg'),
                          /*Image.asset('imagens/povo.jpg',
                                  height: 50, width: 50, fit: BoxFit.cover),*/
                          Image.asset('imagens/cur1.jpg'),
                          Image.asset('imagens/dlc.jpg'),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
