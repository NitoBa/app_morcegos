import 'dart:convert';

import 'package:App_Morcegos/app/models/bat_model.dart';
import 'package:App_Morcegos/app/models/curiosidades_model.dart';
import 'package:App_Morcegos/app/models/ecoinfo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSave {
  String _urlinfo = 'https://api-morcegos.herokuapp.com/ecoinfo';
  String _urlcuriosidades = 'https://api-morcegos.herokuapp.com/curiosidades';
  String _url = 'https://api-morcegos.herokuapp.com/';
  static bool isSaved = false;

  Future saveOffine() async {
    var prefs = await SharedPreferences.getInstance();

    final storage = FlutterSecureStorage();

    Response reseListEspecies = await Dio().get(_url);
    Response resEcoInfo = await Dio().get(_urlinfo);
    Response resCuriosidadesInfo = await Dio().get(_urlcuriosidades);

    isSaved = await prefs.setBool('save', true);

    await storage.write(key: 'dados', value: jsonEncode(reseListEspecies.data));
    await storage.write(
        key: 'dadosEcologia', value: jsonEncode(resEcoInfo.data));
    await storage.write(
        key: 'dadosCuriosidades', value: jsonEncode(resCuriosidadesInfo.data));

    print("Dados salvos");
  }

  Future clearAllData() async {
    var prefs = await SharedPreferences.getInstance();
    final storage = FlutterSecureStorage();

    await storage.delete(key: 'dados');
    await storage.delete(key: 'dadosEcologia');
    await storage.delete(key: 'dadosCuriosidades');
    prefs.remove('save');
    isSaved = false;
  }

  Future loadOffline(
      {List modelList,
      String keyModel,
      String nameModel,
      Function function}) async {
    final storage = FlutterSecureStorage();

    var data = await storage.read(key: keyModel);

    if (modelList.isEmpty && data != null) {
      Iterable decoded = jsonDecode(data);

      _checkModelName(nameModel, modelList, decoded);

      function();
    } else if (data == null)
      return;
    else {
      modelList.clear();

      Iterable decoded = jsonDecode(data);

      _checkModelName(nameModel, modelList, decoded);
      function();
    }
  }

  _checkModelName(nameModel, modelList, decoded) {
    switch (nameModel) {
      case 'morcegos':
        {
          for (Map<String, dynamic> map in decoded) {
            modelList.add(Morcegos.fromJson(map));
          }
        }
        break;
      case 'ecoinfo':
        {
          for (Map<String, dynamic> map in decoded) {
            modelList.add(EcoInfoModel.fromJson(map));
          }
        }
        break;
      case 'curiosidadesinfo':
        {
          for (Map<String, dynamic> map in decoded) {
            modelList.add(CuriosidadesModel.fromJson(map));
          }
        }
        break;
      default:
    }
  }
}
