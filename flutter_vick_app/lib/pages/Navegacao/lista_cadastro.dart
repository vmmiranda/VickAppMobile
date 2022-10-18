import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/Cadastros/eventos.dart';
import 'package:flutter_vick_app/pages/Cadastros/makedeal.dart';
import 'package:flutter_vick_app/pages/Cadastros/pessoas.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/excursao.dart';
import 'package:flutter_vick_app/pages/Relatorios/excursao_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/pagamento.dart';

class ListaCadastros extends StatefulWidget {
  @override
  _ListaCadastros createState() => _ListaCadastros();
}

class _ListaCadastros extends State<ListaCadastros> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Cadastros')),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return PessoasCadastro();
                      },
                    ),
                  );
                },
                child: Text('Cadastro de Clientes',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MakeDeal();
                      },
                    ),
                  );
                },
                child: Text('Cadastro de Reservas',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return CadastroEventos();
                      },
                    ),
                  );
                },
                child: Text('Cadastro de Eventos',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
