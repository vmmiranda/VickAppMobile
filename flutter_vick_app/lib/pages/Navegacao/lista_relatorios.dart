import 'package:flutter/material.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente.dart';
import 'package:flutter_vick_app/pages/Relatorios/cliente_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/excursao.dart';
import 'package:flutter_vick_app/pages/Relatorios/excursao_busca.dart';
import 'package:flutter_vick_app/pages/Relatorios/pagamento.dart';

class ListaRelatorios extends StatefulWidget {
  @override
  _ListaRelatorios createState() => _ListaRelatorios();
}

class _ListaRelatorios extends State<ListaRelatorios> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Relatorios')),
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
                        return ClienteBusca();
                      },
                    ),
                  );
                },
                child: Text('Clientes com busca',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Cliente();
                      },
                    ),
                  );
                },
                child: Text('Clientes',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ExcursaoBusca();
                      },
                    ),
                  );
                },
                child: Text('Eventos com busca',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Excursao();
                      },
                    ),
                  );
                },
                child: Text('Eventos',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Pagamento();
                      },
                    ),
                  );
                },
                child: Text('Pagamentos',
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
