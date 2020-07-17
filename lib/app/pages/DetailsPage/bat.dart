import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Batpage extends StatelessWidget {
  final String especie;
  final String image;
  final String distgeo;
  final String fordent;
  final String repro;
  final String mododevida;
  final String habalim;
  final String familia;
  Batpage(
      {Key key,
      this.distgeo,
      this.image,
      this.especie,
      this.familia,
      this.fordent,
      this.habalim,
      this.mododevida,
      this.repro})
      : super(key: key);

  Widget _buildListTile(String title, String subTitle, Icon leading) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Calibre',
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.justify,
      ),
      leading: leading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: <Widget>[
            SizedBox(
                height: 250,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 40,
                  )),
            ),
            Container(
              //color: Colors.orange,
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 90, left: 10, right: 10),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 120, top: 20),
                                //color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      especie,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Calibre',
                                        fontSize: 28,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Grupo taxonômico:",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Calibre',
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Espécie",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Calibre',
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                  //color: Colors.green,
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Classe:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Mammalia",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Ordem:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Chiroptera",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Família:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        familia,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 20),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1.5),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width - 20,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Informações",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Divider(),
                        _buildListTile("Distribuição geográfica", distgeo,
                            Icon(Icons.room)),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListTile(
                            "Habito Alimentar", habalim, Icon(Icons.fastfood)),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListTile("Fórmula dentária", fordent,
                            Icon(FontAwesomeIcons.teethOpen)),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListTile(
                            "Reprodução",
                            repro,
                            Icon(
                              Icons.pregnant_woman,
                              size: 35,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        _buildListTile("Modo de vida", mododevida,
                            Icon(FontAwesomeIcons.leaf)),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
