import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ComoPagar extends StatefulWidget {
  const ComoPagar();

  @override
  _ComoPagar createState() => _ComoPagar();
}

class _ComoPagar extends State<ComoPagar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Realizando o pagamento"),
        ),
        body: _cabecalho(),
        /*TabBarView(
            children: <Widget>[
              Text("Vai"),
              Text("Segunda guia selecionada"),
              Text("Terceira guia selecionada"),
            ],*/
      ),
    );
  }

  _cabecalho() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(3.0),
            child: Card(
                child: Container(
              padding: EdgeInsets.all(2.0),
              width: 500,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Siga o passo a passo abaixo para confirmar a sua reserva.",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset('imagens/vick_logo.jpg',
                            height: 178.0, width: 140.0, fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 2),
                      child: DefaultTabController(
                          length: 3,
                          child: TabBar(
                            controller: tabController,
                            tabs: <Widget>[
                              Text("Passo Um",
                                  style: TextStyle(color: Colors.black)),
                              Text("Passo Dois",
                                  style: TextStyle(color: Colors.black)),
                              Text("Passo Três",
                                  style: TextStyle(color: Colors.black))
                            ],
                          )
                          //),
                          )),
                  Container(
                      width: double.infinity,
                      height: 220.0,
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 2),
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          parte3(),
                          parte2(),
                          parte1(),
                        ],
                        //),
                      )),
                ],
              ),
            ))));
  }

  parte1() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Após o envio do comprovante será feita a checagem e caso esteja tudo correto você receberá um email com a confirmação da reserva.'),
                Text(' '),
                Text('Caso haja alguma inconsistência entraremos em contato.'),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  parte2() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "O comprovante de pagamento ou foto da imagem de transferência deve ser enviado via email para  "),
                  TextSpan(
                      text: "agenciavicktrips@gmail.com.br",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          var url = "mailto:agenciavicktrips@gmail.com.br";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Não foi possivel enviar o email: $url';
                          }
                        }),
                ])),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  parte3() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Após realizar a reserva será gerado o valor total, para confirmar a reserva será necessário o pagamento do valor em até 4 dias.'),
                Text(' '),
                Text('O pagamento deve ser feito via transferência:'),
                Text(' '),
                Text('Banco : ITAÚ - COD: 341'),
                Text('CC : 23579 - 1'),
                Text('Agência: 7471'),
                Text('Titular da conta: Léia Xavier da Rocha'),
                Text('CNPJ: 24.480.213/0001-26'),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
