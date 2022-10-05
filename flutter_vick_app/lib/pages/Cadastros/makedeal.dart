import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/excursaoModel.dart';
import 'package:flutter_vick_app/service/api_service.dart';
//import 'package:flutter_restapi/services/api_service.dart';
//import 'models/cases.dart';

enum Gender { masculino, feminino }
enum Status { positivo, negativo }

class MakeDeal extends StatefulWidget {
  MakeDeal();

  @override
  _MakeDeal createState() => _MakeDeal();
}

class _MakeDeal extends State<MakeDeal> {
  _MakeDeal();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  //final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String gender = 'masculino';
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  String status = 'positivo';
  Status _status = Status.positivo;

  late List<ExcursaoModel>? _excursaoModel = [];

  String nomeCidade = "";
  var _cidades = [
    'Evento Brotas',
    'Evento Curitiba e Morretes',
    'Evento Ilha das Couves',
    'Evento Ribeira',
    'Evento São Thomé das Letras',
    'Salvador Tour'
  ];
  var _itemSelecionado = 'Evento Brotas';

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  void _getData() async {
    _excursaoModel = (await ApiService().getExcursao())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer Reserva'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 340,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Column(
                            children: <Widget>[
                              Text('Evento'),
                              DropdownButton(
                                  items: _cidades.map((item) {
                                    return new DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (newval) {
                                    setState(() {
                                      this._itemSelecionado = newval.toString();
                                    });
                                  },
                                  value: _itemSelecionado),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'Quantidade de pessoas',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor digite a quantidade';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
          //),
        ),
      ),
    );
  }
}
