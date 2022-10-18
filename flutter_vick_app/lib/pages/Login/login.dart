import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_vick_app/pages/Cadastros/pessoas.dart';
import 'package:flutter_vick_app/pages/Reservas/principal.dart';
import 'package:flutter_vick_app/pages/Widgets/animatedsplashscreen.dart';

import '../Navegacao/navegacao.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo, Vick Viagens e Turismo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            textFormFieldLogin(),
            textFormFieldSenha(),
            containerButton(context),
            containerNovoUsuario(context),
          ],
        ));
  }

  TextFormField textFormFieldLogin() {
    return TextFormField(
        controller: _tLogin,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe o login';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Login",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha"));
  }

  TextFormField textFormFieldSenha() {
    return TextFormField(
        controller: _tSenha,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe a senha';
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            hintText: "Informe a senha"));
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        color: Colors.blue,
        child: Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 15.0)),
        onPressed: () {
          _onClickLogin(context);
        },
      ),
    );
  }

  Container containerNovoUsuario(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        color: Colors.blue,
        child: Text("Novo Usuário",
            style: TextStyle(color: Colors.white, fontSize: 15.0)),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return PessoasCadastro();
              },
            ),
          );
        },
      ),
    );
  }

  Container linkButton(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      child: Linkify(
        onOpen: (link) async {},
        text: "Made by https://cretezy.com",
        style: TextStyle(color: Colors.black),
        linkStyle: TextStyle(color: Colors.blue),
      ),
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print("Login: $login , Senha: $senha ");
    if (_formKey.currentState!.validate()) {
      if (login == "admin") {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Navegacao()),
        );
      } else {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreenViagem()),
        );
      }
    }
    if (login.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }
  }
}
