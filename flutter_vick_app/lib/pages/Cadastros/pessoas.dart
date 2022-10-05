import 'package:flutter/material.dart';
//import 'package:flutter_restapi/services/api_service.dart';
//import 'models/cases.dart';

enum Gender { masculino, feminino }
enum Status { positivo, negativo }

class PessoasCadastro extends StatefulWidget {
  PessoasCadastro();

  @override
  _PessoasCadastro createState() => _PessoasCadastro();
}

class _PessoasCadastro extends State<PessoasCadastro> {
  _PessoasCadastro();

  //final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String gender = 'masculino';
  Gender _gender = Gender.masculino;
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  String status = 'positivo';
  Status _status = Status.positivo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(3.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(2.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Column(
                            children: <Widget>[
                              Text('Nome'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o seu nome';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('RG'),
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'RG',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o seu RG';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('CPF'),
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'CPF',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o seu CPF';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Sexo'),
                              ListTile(
                                title: const Text('Masculino'),
                                leading: Radio<Gender>(
                                  value: Gender.masculino,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'masculino';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Feminino'),
                                leading: Radio<Gender>(
                                  value: Gender.feminino,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'feminino';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Data de Nascimento'),
                              TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                  hintText: 'Dt. Nascimento',
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite a data de nascimento';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Cidade'),
                              TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  hintText: 'Cidade',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite a Cidade';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Orgão Expeditor'),
                              TextFormField(
                                controller: _countryController,
                                decoration: const InputDecoration(
                                  hintText: 'Orgão Expeditor',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o Orgão Expeditor';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Email'),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o Email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Telefone'),
                              TextFormField(
                                controller: _telefoneController,
                                decoration: const InputDecoration(
                                  hintText: 'Telefone',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite o telefone';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              Text('Autoriza a postagem de fotos?'),
                              ListTile(
                                title: const Text('Sim'),
                                leading: Radio(
                                  value: Status.positivo,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'positivo';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Não'),
                                leading: Radio(
                                  value: Status.negativo,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'negativo';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    /* api.createCase(Cases(
                                        name: _nameController.text,
                                        gender: gender,
                                        age: int.parse(_ageController.text),
                                        address: _addressController.text,
                                        city: _cityController.text,
                                        country: _countryController.text,
                                        status: status));*/

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Salvar',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
