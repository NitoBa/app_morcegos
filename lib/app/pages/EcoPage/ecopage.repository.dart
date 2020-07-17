import 'package:App_Morcegos/app/models/ecoinfo_model.dart';
import 'package:dio/dio.dart';

class EcoRepository {
  String _url = 'https://api-morcegos.herokuapp.com/ecoinfo';

  static List<EcoInfoModel> ecoInfo = List<EcoInfoModel>();

  Future<EcoInfoModel> getEcoInfos() async {
    Response _response = await Dio().get(_url);
    var list = _response.data;

    for (Map<String, dynamic> ecoInfosMap in list) {
      ecoInfo.add(EcoInfoModel.fromJson(ecoInfosMap));
    }

    return ecoInfo[0];
  }
}
