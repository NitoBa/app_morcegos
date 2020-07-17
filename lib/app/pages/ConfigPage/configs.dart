import 'package:App_Morcegos/app/services/api.repository.dart';
import 'package:App_Morcegos/app/shared/saveoffline.dart';
import 'package:flutter/material.dart';

class Configs extends StatefulWidget {
  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  bool _busy = false;
  String _text1 = "Limpar dados salvos";
  String _text2 = "Salvar dados offline";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Para salvar os dados de maneira offline é necessário está conectado a internet. Após os dados serem salvos será possível acessá-los sem o uso de intenet.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          _busy
              ? CircularProgressIndicator()
              : RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _text2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
                      setState(() {
                        _busy = true;
                      });
                      SharedSave().saveOffine().whenComplete(() {
                        setState(() {
                          _text2 = "Dados salvos";
                          _busy = false;
                        });
                      });
                      // BatAPI().saveOffine().whenComplete(() {
                      //   setState(() {
                      //     _text2 = "Dados salvos";
                      //     _busy = false;
                      //   });
                      // });
                    } else {
                      setState(() {
                        _text2 = "Sem conexão com a internet. Tente novamente";
                      });
                    }
                  },
                ),
          RaisedButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _text1,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              SharedSave().clearAllData().whenComplete(() {
                setState(() {
                  _text1 = "Dados limpos";
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
