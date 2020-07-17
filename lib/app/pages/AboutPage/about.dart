import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Sobre"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                buildDevs(context,
                    image: "images/bruno.jpg",
                    nome: "Bruno Alves de Sousa Santos",
                    infos:
                        "Graduando em Ciências Biológicas e desenvolvedor mobile",
                    inst: "https://www.instagram.com/nito_b.a/?hl=pt-br",
                    linkedin:
                        "https://www.linkedin.com/in/bruno-alves-de-sousa-santos-882173161/",
                    email: 'bruno.santos@ifpi.edu.br'),
                SizedBox(
                  height: 20,
                ),
                buildDevs(context,
                    image: "images/mayky.jpg",
                    nome: "Mayky Carvalho de Oliveira",
                    infos:
                        "Graduando em Ciências Biológicas e desenvolvedor mobile",
                    inst: "https://www.instagram.com/mayky_carvalho/?hl=pt-br",
                    email: 'mayky.c.oliveira@gmail.com'),
                SizedBox(
                  height: 20,
                ),
                buildDevs(context,
                    image: "images/wendell.jpg",
                    nome: "Wendell Kennedy Azevedo Vasconcelos",
                    infos:
                        "Graduado em Ciências Biológicas e colaborador voluntário",
                    inst: "https://www.instagram.com/wendell.profbio/",
                    email: 'wendell9bio@gmail.com'),
                SizedBox(
                  height: 20,
                ),
                buildDevs(context,
                    image: "images/marcelo.jpg",
                    nome: "Marcelo Cardoso da Silva Ventura",
                    infos: "Professor mestre em Ciências Biológicas",
                    email: 'marceloventura@ifpi.edu.br'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                      """Esse aplicativo foi desenvolvido com o intuíto de listar a diversidade biológica de morcegos do Piauí.

Fruto de um projeto de iniciação a pesquisa científica (PIBIC) desenvolvida no Instituto Federal do Piauí - Campus Teresina Central.

Todas as coletas realizadas foram autorizadas pelo ICMbio.
                      """, style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                      ),
                )
              ],
            ),
          ),
        ));
  }
}

buildDevs(BuildContext context,
    {String image,
    String nome,
    String infos,
    String inst,
    String linkedin,
    String email}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 5)],
        borderRadius: BorderRadius.circular(15)),
    child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image.asset(image),
          ),
        ),
        title: Text(nome),
        subtitle: Text(infos),
        trailing: IconButton(
          icon: Icon(FontAwesomeIcons.info),
          onPressed: () {
            buildBottonSheet(context,
                instagram: inst, linkedin: linkedin, email: email);
          },
        )),
  );
}

buildBottonSheet(context, {String instagram, String linkedin, String email}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (instagram != null && linkedin != null) {
          return Container(
              child: Wrap(children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.linkedin),
              title: Text("LinkedIn"),
              onTap: () {
                url_launcher.launch(linkedin);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.instagram),
              title: Text("Instagram"),
              onTap: () {
                url_launcher.launch(instagram);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.envelope),
              title: Text("E-mail"),
              subtitle: Text(email),
            ),
          ]));
        } else if (linkedin == null && instagram != null) {
          return Container(
              child: Wrap(children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.instagram),
              title: Text("Instagram"),
              onTap: () {
                url_launcher.launch(instagram);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.envelope),
              title: Text("E-mail"),
              subtitle: Text(email),
            )
          ]));
        } else if (instagram == null && linkedin != null) {
          return Container(
              child: Wrap(children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.linkedin),
              title: Text("LinkedIn"),
              onTap: () {
                url_launcher.launch(linkedin);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.envelope),
              title: Text("E-mail"),
              subtitle: Text(email),
            )
          ]));
        } else {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(FontAwesomeIcons.envelope),
                  title: Text("E-mail"),
                  subtitle: Text(email),
                ),
              ],
            ),
          );
        }
      });
}
