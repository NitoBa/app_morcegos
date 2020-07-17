import 'package:App_Morcegos/app/pages/CuriosidedadesPage/curiosidades-controller.dart';
import 'package:flutter/material.dart';

class CuriosidadesPage extends StatelessWidget {
  final curiosidadesController = CuriosidadeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Curiosidades",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'O que se pensa em relação ao morcegos?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Descubra alguns mitos e verdades',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: curiosidadesController.buildListCuriosidades())
          ],
        ));
  }
}
