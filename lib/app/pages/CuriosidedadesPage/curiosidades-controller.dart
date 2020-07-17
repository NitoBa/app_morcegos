import 'package:App_Morcegos/app/pages/CuriosidedadesPage/curiosidades-repository.dart';
import 'package:App_Morcegos/app/services/api.repository.dart';
import 'package:App_Morcegos/app/shared/saveoffline.dart';
import 'package:flutter/material.dart';

class CuriosidadeController {
  final repository = CuriosidadesRepository();
  final shared = SharedSave();
  var curiosidadesInfo = CuriosidadesRepository.curiosidadesInfo;

  Widget buildListCuriosidades() {
    if (BatAPI.statusconect == 2 && SharedSave.isSaved) {
      return FutureBuilder(
        future: shared.loadOffline(
            modelList: CuriosidadesRepository.curiosidadesInfo,
            keyModel: 'dadosCuriosidades',
            nameModel: 'curiosidadesinfo',
            function: () {}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: curiosidadesInfo.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 8,
                            spreadRadius: 2)
                      ]),
                  child: ListTile(
                    title: Text(
                      curiosidadesInfo[index].title,
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      curiosidadesInfo[index].curiosidade,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    } else if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
      return FutureBuilder(
        future: repository.getCuriosidadesInfos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 8,
                            spreadRadius: 2)
                      ]),
                  child: ListTile(
                    title: Text(
                      snapshot.data[index].title,
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      snapshot.data[index].curiosidade,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    } else {
      return Center(child: Text("Não há conexão com a intenet"));
    }
  }
}
