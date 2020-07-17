import 'package:App_Morcegos/app/pages/EcoPage/ecopage.repository.dart';
import 'package:App_Morcegos/app/services/api.repository.dart';
import 'package:App_Morcegos/app/shared/saveoffline.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class EcoPageController {
  List title = [
    "Quem são os morcegos?",
    "Anatomia e morfologia",
    "Ecolocalização",
    "Pricipais inimigos",
    "Reprodução",
  ];
  var ecoinfo = EcoRepository.ecoInfo;
  final shared = SharedSave();
  Widget loadImage() {
    if (BatAPI.statusconect == 2 && SharedSave.isSaved) {
      return FutureBuilder(
        future: shared.loadOffline(
            modelList: EcoRepository.ecoInfo,
            keyModel: 'dadosEcologia',
            nameModel: 'ecoinfo',
            function: () {}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Swiper(
              pagination: SwiperPagination(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: [
                    ecoinfo[0].imgmorf,
                    ecoinfo[0].imgskeleton,
                    ecoinfo[0].imgecoloc,
                  ][index],
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
        future: EcoRepository().getEcoInfos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Swiper(
              pagination: SwiperPagination(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: [
                    snapshot.data.imgmorf,
                    snapshot.data.imgskeleton,
                    snapshot.data.imgecoloc,
                  ][index],
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

  Widget loadInfos({EcoRepository repository}) {
    if (BatAPI.statusconect == 2 && SharedSave.isSaved) {
      return FutureBuilder(
        future: shared.loadOffline(
            modelList: EcoRepository.ecoInfo,
            keyModel: 'dadosEcologia',
            nameModel: 'ecoinfo',
            function: () {}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return loadPageView(children: [
              _buildPage(title: title[0], description: ecoinfo[0].quem),
              _buildPage(
                title: title[1],
                description: ecoinfo[0].anatomorfologia,
              ),
              _buildPage(
                title: title[2],
                description: ecoinfo[0].ecoloc,
              ),
              _buildPage(
                title: title[3],
                description: ecoinfo[0].inimigos,
              ),
              _buildPage(
                title: title[4],
                description: ecoinfo[0].repro,
              ),
            ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    } else if (BatAPI.statusconect == 0 || BatAPI.statusconect == 1) {
      return FutureBuilder(
        future: repository.getEcoInfos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return loadPageView(children: [
              _buildPage(
                title: title[0],
                description: snapshot.data.quem,
              ),
              _buildPage(
                title: title[1],
                description: snapshot.data.anatomorfologia,
              ),
              _buildPage(
                title: title[2],
                description: snapshot.data.ecoloc,
              ),
              _buildPage(
                title: title[3],
                description: snapshot.data.inimigos,
              ),
              _buildPage(
                title: title[4],
                description: snapshot.data.repro,
              ),
            ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    } else {
      return Center(child: Text("Não há conexão com a internet"));
    }
  }

  Widget loadPageView({List<Widget> children}) {
    return PageView(children: children);
  }
  //List<EcoInfoModel> ecoinfo = EcoRepository.ecoInfo;
}

Widget _buildPage(
    {String title = "morcegos", String description = "morcegos"}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(fontSize: 20, color: Colors.grey),
          textAlign: TextAlign.justify,
        )
      ],
    ),
  );
}
