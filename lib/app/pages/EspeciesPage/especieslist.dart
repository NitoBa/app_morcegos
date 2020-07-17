import 'package:App_Morcegos/app/pages/EspeciesPage/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Especies extends StatefulWidget {
  @override
  _EspeciesState createState() => _EspeciesState();
}

class _EspeciesState extends State<Especies> {
  final especiecontroller = EspeciesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Builder(
          builder: (ctx) => Stack(
            children: <Widget>[
              Image.asset(
                "images/animals_hero_bats.jpg",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    )),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 160),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("Lista de espécies",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.grey)),
                            Icon(
                              Icons.list,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ],
                        )),
                        RefreshIndicator(
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: especiecontroller.morcegos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 40,
                                          left: 20,
                                          right: 20,
                                          bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[300],
                                                blurRadius: 10,
                                                spreadRadius: 4)
                                          ]),
                                      height: 250,
                                      child: GestureDetector(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                //color: Colors.red,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(8),
                                                            topRight:
                                                                Radius.circular(
                                                                    8)),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          especiecontroller
                                                              .morcegos[index]
                                                              .image,
                                                      placeholder: (_, url) =>
                                                          Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ))),
                                            Container(
                                              //color: Colors.green,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                      especiecontroller
                                                          .morcegos[index]
                                                          .especie,
                                                      style: TextStyle(
                                                          fontSize: 25)),
                                                  IconButton(
                                                    icon: Icon(FontAwesomeIcons
                                                        .paperPlane),
                                                    onPressed: () {
                                                      especiecontroller
                                                          .openPage(
                                                              context, index);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          especiecontroller.openPage(
                                              context, index);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          onRefresh: () async {
                            especiecontroller.refresh(ctx);
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
