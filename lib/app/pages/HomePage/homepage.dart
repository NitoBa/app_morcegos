import 'package:App_Morcegos/app/models/bat_model.dart';
import 'package:App_Morcegos/app/pages/ConfigPage/configs.dart';
import 'package:App_Morcegos/app/pages/EspeciesPage/controller.dart';
import 'package:App_Morcegos/app/pages/List_TaxonsPage/list-taxons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(8),
          child: Image.asset("images/bat.png"),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Morcegos do Piauí",
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                      child: Text("Sobre o App"),
                      onTap: () {
                        Navigator.pushNamed(context, 'aboutpage');
                      }),
                ),
                PopupMenuItem(
                    child: GestureDetector(
                        child: Text("Configurações"),
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Configs()));
                        }))
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70, left: 20),
            decoration: BoxDecoration(
                //color: Colors.green
                ),
            child: Text(
              "Bem-vindo ao Morcegos do Piauí !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 160, left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                  child: Text(
                "Navegue pelas categorias e encontre o que procura",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ))),
          Container(
            padding: EdgeInsets.only(top: 15),
            margin: EdgeInsets.only(top: 270),
            height: 500,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.96),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Grupos taxonômicos",
                        style: TextStyle(fontSize: 28),
                      ),
                      Icon(Icons.import_contacts)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    //padding: EdgeInsets.all(5),
                    children: <Widget>[
                      _buildGrid(
                        context,
                        title: "Famílias",
                      ),
                      _buildGrid(
                        context,
                        title: "Subfamílias",
                      ),
                      _buildGrid(
                        context,
                        title: "Gêneros",
                      ),
                      _buildGrid(context, title: "Espécies"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildGrid(context, {String title}) {
  final controller = EspeciesController();

  return Observer(builder: (_) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: FlatButton(
        onPressed: () {
          switch (title) {
            case 'Famílias':
              {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            Lists(title: title, lists: Morcegos.familias)));
              }
              break;
            case 'Subfamílias':
              {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            Lists(title: title, lists: Morcegos.subfamilias)));
              }
              break;
            case 'Gêneros':
              {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            Lists(title: title, lists: Morcegos.generos)));
              }
              break;
            case 'Espécies':
              {
                controller.openEspecies(context);
              }
              break;
            default:
          }
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.featured_play_list)
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 30),
            Opacity(
              opacity: controller.opacity,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  });
}
