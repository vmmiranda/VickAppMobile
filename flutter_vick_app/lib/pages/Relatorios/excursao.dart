import 'package:flutter/material.dart';
import 'package:flutter_vick_app/model/excursaoModel.dart';
import 'package:flutter_vick_app/service/api_service.dart';

class Excursao extends StatefulWidget {
  const Excursao({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Excursao> {
  late List<ExcursaoModel>? _excursaoModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _excursaoModel = (await ApiService().getExcursao())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retorno Reservas'),
      ),
      body: new ListView.builder(
        itemCount: _excursaoModel == null ? 0 : _excursaoModel!.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(_excursaoModel![index].nome),
              subtitle: Text(_excursaoModel![index].nomeEvento),
              trailing: Text(_excursaoModel![index].idexcursao.toString()),
            ),
          );
        },
      ),
    );
  }
}
