import 'dart:async';
import 'package:App_Morcegos/app/models/bat_model.dart';
import 'package:App_Morcegos/app/pages/DetailsPage/bat.dart';
import 'package:App_Morcegos/app/pages/EspeciesPage/especieslist.dart';
import 'package:App_Morcegos/app/services/api.repository.dart';
import 'package:App_Morcegos/app/shared/saveoffline.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class EspeciesController = _EspeciesControllerBase with _$EspeciesController;

abstract class _EspeciesControllerBase with Store {
  final service = BatAPI();
  final shared = SharedSave();

  @observable
  ObservableList<Morcegos> morcegos = BatAPI.morcegos.asObservable();

  @observable
  double opacity = 0;

  @action
  void openEspecies(context) {
    setOpacity();
    if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
      service.consumiApi(context);
    } else if (BatAPI.statusconect == 2 && SharedSave.isSaved) {
      shared.loadOffline(
          modelList: BatAPI.morcegos,
          nameModel: 'morcegos',
          keyModel: 'dados',
          function: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Especies()));
          });
      print("Dados salvos carregados");
    } else {
      Timer(Duration(seconds: 3), () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Sem conexão com a internet ou dados salvos",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
        ));
        setOpacity();
      });
    }
  }

  @action
  setOpacity() {
    if (opacity == 0) {
      opacity = 1;
    } else {
      opacity = 0;
    }
  }

  @action
  refresh(context) {
    if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
      service.refresh(context);
    } else if (BatAPI.statusconect == 2 && SharedSave.isSaved)
      return;
    else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Sem conexão com a internet ou dados salvos",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  loadDatainBatPage(context, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Batpage(
                  image: morcegos[index].image,
                  especie: morcegos[index].especie,
                  familia: morcegos[index].familia,
                  repro: morcegos[index].repro,
                  fordent: morcegos[index].fordent.info,
                  habalim: morcegos[index].habalim,
                  distgeo: morcegos[index].distgeo,
                  mododevida: morcegos[index].mododevida,
                )));
  }

  @action
  void openPage(context, int index) {
    if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
      loadDatainBatPage(context, index);
    } else if (BatAPI.statusconect == 2 && SharedSave.isSaved) {
      loadDatainBatPage(context, index);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "Sem conexão com a internet ou dados salvos",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
