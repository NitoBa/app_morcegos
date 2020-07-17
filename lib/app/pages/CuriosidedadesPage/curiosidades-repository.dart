import 'package:App_Morcegos/app/models/curiosidades_model.dart';
import 'package:dio/dio.dart';

class CuriosidadesRepository {
  String _url = 'https://api-morcegos.herokuapp.com/curiosidades';

  static List<CuriosidadesModel> curiosidadesInfo = List<CuriosidadesModel>();

  Future getCuriosidadesInfos() async {
    if (curiosidadesInfo.isEmpty) {
      Response _response = await Dio().get(_url);
      var list = _response.data;

      for (Map<String, dynamic> curiosidadesInfosMap in list) {
        curiosidadesInfo.add(CuriosidadesModel.fromJson(curiosidadesInfosMap));
      }
      print('Lista vazia');

      return curiosidadesInfo;
    } else {
      curiosidadesInfo.clear();

      Response _response = await Dio().get(_url);
      var list = _response.data;

      for (Map<String, dynamic> curiosidadesInfosMap in list) {
        curiosidadesInfo.add(CuriosidadesModel.fromJson(curiosidadesInfosMap));
      }
      print('Lista não vazia');
      return curiosidadesInfo;
    }
  }
}
