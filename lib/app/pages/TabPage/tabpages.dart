import 'package:App_Morcegos/app/pages/CuriosidedadesPage/curiosidades-page.dart';
import 'package:App_Morcegos/app/pages/EcoPage/ecopage.dart';
import 'package:App_Morcegos/app/pages/HomePage/homepage.dart';
import 'package:App_Morcegos/app/pages/dados.dart';
import 'package:App_Morcegos/app/services/api.repository.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class BottomNavigationBarBat extends StatefulWidget {
  @override
  _BottonNavigationBarBatState createState() => _BottonNavigationBarBatState();
}

class _BottonNavigationBarBatState extends State<BottomNavigationBarBat> {
  @override
  void initState() {
    checkConection();
    subscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult wi) {
      BatAPI.statusconect = wi.index;
      //print(BatAPI.statusconect);
    });
    super.initState();
  }

  var subscription;

  int _currentTabIndex = 0;

  Future<void> checkConection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      connectivityResult.index.toString();
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Wifi Contectado");
    } else {
      print("Não há conexão, habilite");
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    final _ktabPages = <Widget>[
      Homepage(),
      LocalPage(),
      EcoPage(),
      CuriosidadesPage(),
    ];

    final _kTabPagesNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Início")),
      BottomNavigationBarItem(
          icon: Icon(Icons.room), title: Text("Locais Coletas")),
      BottomNavigationBarItem(
          icon: Icon(Icons.photo_size_select_actual), title: Text("Ecologia")),
      BottomNavigationBarItem(
          icon: Icon(Icons.forum), title: Text("Curiosidades")),
    ];
    assert(_ktabPages.length == _kTabPagesNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.white,
      items: _kTabPagesNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavBar,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _ktabPages[_currentTabIndex],
        ),
      ),
      onWillPop: () => Future.value(false),
    );
  }
}

class LocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Locais de coleta"),
          leading: Icon(Icons.location_on),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              buildListLocal(
                  context: context,
                  image: Dados.flona['image'],
                  title: Dados.flona['title'],
                  subtitle: Dados.flona['subtitle'],
                  linkmap: Dados.flona['linkmap']),
              SizedBox(
                height: 30,
              ),
              buildListLocal(
                  context: context,
                  image: Dados.palmeira['image'],
                  title: Dados.palmeira['title'],
                  subtitle: Dados.palmeira['subtitle'],
                  linkmap: Dados.palmeira['linkmap']),
            ],
          ),
        ));
  }
}

Widget buildListLocal(
    {context, String image, String title, String subtitle, String linkmap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 2.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 160,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 6,
              )
            ]),
        child: ListTile(
            title: Text(
              title,
              softWrap: true,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Text(subtitle),
            trailing: Icon(
              Icons.room,
              size: 30,
            ),
            onTap: () {
              url_launcher.launch(linkmap);
            }),
      ),
    ],
  );
}
