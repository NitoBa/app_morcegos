import 'package:App_Morcegos/app/pages/EcoPage/ecopage.repository.dart';
import 'package:App_Morcegos/app/pages/EcoPage/ecopagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class EcoPage extends StatefulWidget {
  @override
  _EcoPageState createState() => _EcoPageState();
}

class _EcoPageState extends State<EcoPage> {
  final pagecontroller = PageController();
  final controller = EcoPageController();
  final repository = EcoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 35, bottom: 25, left: 15, right: 15),
              height: MediaQuery.of(context).size.height / 1.7,
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
                  Container(
                    child: Text(
                      "Ecologia de Morcegos",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              spreadRadius: 2),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: controller.loadImage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SolidBottomSheet(
        draggableBody: true,
        minHeight: MediaQuery.of(context).size.height / 4,
        headerBar: Container(
          alignment: Alignment.center,
          child: Text("Deslize para cima"),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 2)
              ]),
        ), // Your header here
        body: Container(
          height: 30,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: controller.loadInfos(
              repository: repository,
            ),
          ),
        ),
      ),
    );
  }
}
