import 'package:App_Morcegos/app/models/bat_model.dart';
import 'package:App_Morcegos/app/pages/EspeciesPage/especieslist.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BatAPI {
  static List<Morcegos> morcegos = List<Morcegos>();

  static int statusconect;

  String _url = 'https://api-morcegos.herokuapp.com/';

  //Carregar dados online
  Future _getDatainApi({Function completed}) async {
    Response response = await Dio().get(_url);

    List data = response.data;

    for (Map<String, dynamic> batMap in data) {
      morcegos.add(Morcegos.fromJson(batMap));

      print(morcegos.length);
    }
  }

  Future consumiApi(context) async {
    if (morcegos.isEmpty) {
      _getDatainApi().whenComplete(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Especies()));
      });
    } else {
      morcegos.clear();

      _getDatainApi().whenComplete(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Especies()));
      });
    }
  }

  refresh(context) async {
    morcegos.clear();

    _getDatainApi().whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Especies()));
    });
  }
}
